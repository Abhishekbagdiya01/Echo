import 'dart:developer';

import 'package:echo/bloc/user_bloc/user_bloc_bloc.dart';
import 'package:echo/model/user_model.dart';
import 'package:echo/repository/chat_repository.dart';
import 'package:echo/repository/user_repository.dart';
import 'package:echo/screens/chat_screens/full_screen_chat.dart';
import 'package:echo/screens/profile_screen.dart';
import 'package:echo/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FamilyScreen extends StatefulWidget {
  FamilyScreen({super.key});

  @override
  State<FamilyScreen> createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  final searchController = TextEditingController();

  String? token;
  String? uid;
  dynamic allChatRoom;
  List userData = [];
  List<UserDataModel?>? userDataModel = [];
  getTokenAndUid() async {
    token = (await SharedPref().getRefreshToken())!;
    uid = (await SharedPref().getUid())!;

    allChatRoom = await ChatRepository().getChatRoom(uid!, token!);

    if (allChatRoom != null) {
      getUserInfoById();
    }
    setState(() {});
  }

  getUserInfoById() async {
    for (var i = 0; i < allChatRoom.length; i++) {
      final userData = await UserRepository()
          .getUserById(allChatRoom[i]['receiverId'], token);
      userDataModel!.add(userData);
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTokenAndUid();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                onChanged: (name) async {
                  log("Name : $name || Token : $token ");
                  BlocProvider.of<UserBloc>(context)
                      .add(SearchUserEvent(name: name, token: token!));
                },
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: userData.length != 0 ? 200 : 0,
              child: BlocBuilder<UserBloc, UserBlocState>(
                builder: (context, state) {
                  if (state is UserBlocSearchState) {
                    userData = state.userData;
                    return ListView.builder(
                        itemCount: state.userData.length,
                        itemBuilder: (context, index) => ListTile(
                              leading:
                                  state.userData[index]['profileImage'] != ""
                                      ? CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                              "${state.userData[index]['profileImage']}"),
                                        )
                                      : CircleAvatar(
                                          radius: 30,
                                        ),
                              title: Text(
                                  "${state.userData[index]['firstName']} ${state.userData[index]['lastName']}"),
                              subtitle:
                                  Text("@${state.userData[index]['username']}"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FullScreenChatScreen(
                                          uid: uid!,
                                          token: token!,
                                          receiverUid: state.userData[index]
                                              ['id'],
                                          name:
                                              "${state.userData[index]['firstName']} ${state.userData[index]['lastName']}"),
                                    ));
                              },
                            ));
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.sizeOf(context).height * 0.1,
            //   child: allChatRoom == null
            //       ? Text("No chats are available")
            //       : ListView.builder(
            //           itemCount: allChatRoom.length,
            //           itemBuilder: (context, index) {
            //             return Text(
            //               userDataModel!.length != 0
            //                   ? userDataModel![index]!.username!
            //                   : "",
            //               style: TextStyle(fontSize: 24),
            //             );
            //           },
            //         ),
            // )
          ],
        ),
      ),
    );
  }
}
