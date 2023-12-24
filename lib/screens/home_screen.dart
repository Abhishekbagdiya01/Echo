import 'dart:developer';

import 'package:echo/bloc/user_bloc/user_bloc_bloc.dart';
import 'package:echo/route/page_const.dart';
import 'package:echo/screens/chat_screens/chat_scree.dart';
import 'package:echo/utils/global_variables.dart';
import 'package:echo/utils/shared_pref.dart';
import 'package:echo/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getUserById();
  }

  getUserById() async {
    String uid = (await SharedPref().getUid())!;
    String token = (await SharedPref().getRefreshToken())!;
    log("UID : $uid   || Token : $token");
    BlocProvider.of<UserBloc>(context)
        .add(GetUserDataEvent(uid: uid, token: token));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black,
        title: BlocBuilder<UserBloc, UserBlocState>(builder: (context, state) {
          if (state is UserBlocLoadedState) {
            return Text(
              "Hi,${state.userData.username}",
              style:
                  GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold),
            );
          } else {
            return SizedBox();
          }
        }),
        actions: [
          IconButton(
              icon: Image.asset("assets/images/add_post_icon.png"),
              onPressed: () {
                Navigator.pushNamed(context, PageConst.UploadPostScreen);
              }),
          IconButton(
              icon: Image.asset("assets/images/chat_icon.png"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ));
              }),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            return Container();
            // return postCard(
            //     username: dummyData[index]["name"],
            //     profileUrl: dummyData[index]["profileUrl"],
            //     location: dummyData[index]["location"],
            //     postType: dummyData[index]["postType"],
            //     content: dummyData[index]["content"]);
          },
        ),
      ),
    );
  }
}
