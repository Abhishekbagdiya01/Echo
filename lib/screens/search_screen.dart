import 'dart:developer';

import 'package:echo/bloc/user_bloc/user_bloc_bloc.dart';
import 'package:echo/model/user_model.dart';
import 'package:echo/screens/profile_screen.dart';
import 'package:echo/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: TextField(
                    controller: searchController,
                    onChanged: (name) async {
                      String token = (await SharedPref().getRefreshToken())!;
                      log("Name : $name || Token : $token ");
                      BlocProvider.of<UserBloc>(context)
                          .add(SearchUserEvent(name: name, token: token));
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                BlocBuilder<UserBloc, UserBlocState>(
                  builder: (context, state) {
                    if (state is UserBlocLoadingState) {
                      if (searchController.text == "") {
                        return Center(child: Text(""));
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    } else if (state is UserBlocSearchState) {
                      return SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        child: ListView.builder(
                          itemCount: state.userData.length,
                          itemBuilder: (context, index) {
                            return ListTile(
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
                                      builder: (context) => ProfileScreen(
                                          uid: state.userData[index]['id']),
                                    ));
                              },
                            );
                          },
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
