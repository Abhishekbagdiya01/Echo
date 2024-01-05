import 'dart:async';
import 'dart:developer';

import 'package:echo/bloc/user_bloc/user_bloc_bloc.dart';
import 'package:echo/model/user_model.dart';
import 'package:echo/repository/user_repository.dart';
import 'package:echo/screens/profile_screen.dart';
import 'package:echo/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowerFollowingScreen extends StatefulWidget {
  FollowerFollowingScreen(
      {required this.initialIndex,
      required this.followersId,
      required this.followingId,
      super.key});
  int initialIndex;
  List followersId;
  List followingId;

  @override
  State<FollowerFollowingScreen> createState() =>
      _FollowerFollowingScreenState();
}

class _FollowerFollowingScreenState extends State<FollowerFollowingScreen> {
  String? token;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  void getToken() async {
    token = await SharedPref().getRefreshToken();
    setState(() {});
    // Timer(Duration(milliseconds: 3000), () {
    //   log("REF TOKEN : $token");
    //   BlocProvider.of<UserBloc>(context).add(
    //       FetchFollowersEvent(followersUid: widget.followersId, token: token!));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.initialIndex,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(
              text: "Followers",
            ),
            Tab(
              text: "Following",
            )
          ]),
        ),
        body: token != null
            ? Container(
                child: TabBarView(children: [
                //Follower

                // BlocBuilder<UserBloc, UserBlocState>(
                //   builder: (context, state) {
                //     if (state is FollowersLoadedState) {
                //       List<UserDataModel> followerList = state.followerList;
                //       return ListView.builder(
                //         itemCount: followerList.length,
                //         itemBuilder: (context, index) {
                //           return ListTile(
                //             leading: CircleAvatar(
                //               radius: 30,
                //             ),
                //             title: Text(
                //                 "${followerList[index].firstName} ${followerList[index].lastName}"),
                //             subtitle: Text("${followerList[index].username}"),
                //             onTap: () {
                //               Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                     builder: (context) =>
                //                         ProfileScreen(uid: widget.followersId[index]),
                //                   ));
                //             },
                //           );
                //         },
                //       );
                //     } else {
                //       return SizedBox();
                //     }
                //   },
                // ),

                ListView.builder(
                  itemCount: widget.followersId.length,
                  itemBuilder: (context, index) {
                    UserRepository().fetchFollowers(
                        followerUid: widget.followersId, token: token);
                    return FutureBuilder(
                      future: UserRepository()
                          .getUserById(widget.followersId[index], token),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                            ),
                            title: Text(
                                "${snapshot.data!.firstName} ${snapshot.data!.lastName}"),
                            subtitle: Text("${snapshot.data!.username}"),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileScreen(
                                        uid: widget.followersId[index]),
                                  ));
                            },
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    );
                  },
                ),

                //Following

                ListView.builder(
                  itemCount: widget.followingId.length,
                  itemBuilder: (context, index) {
                    return FutureBuilder(
                      future: UserRepository()
                          .getUserById(widget.followingId[index], token),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                            ),
                            title: Text(
                                "${snapshot.data!.firstName} ${snapshot.data!.lastName}"),
                            subtitle: Text("${snapshot.data!.username}"),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileScreen(
                                        uid: widget.followingId[index]),
                                  ));
                            },
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    );
                  },
                )

                // child: ListView.builder(
                //   itemCount: widget.followingId.length,
                //   itemBuilder: (context, index) {
                //     token != ""
                //         ? BlocProvider.of<UserBloc>(context).add(GetUserDataEvent(
                //             uid: widget.followingId[index], token: token))
                //         : Timer(Duration(microseconds: 1000), () {
                //             log("TOKEN : $token");
                //             BlocProvider.of<UserBloc>(context).add(GetUserDataEvent(
                //                 uid: widget.followingId[index], token: token));
                //           });
                //     return BlocBuilder<UserBloc, UserBlocState>(
                //       builder: (context, state) {
                //         if (state is UserBlocLoadedState) {
                //           return ListTile(
                //             leading: CircleAvatar(
                //               radius: 30,
                //             ),
                //             title: Text(
                //                 "${state.userData.firstName} ${state.userData.lastName}"),
                //             subtitle: Text("${state.userData.username}"),
                //           );
                //         } else {
                //           return SizedBox();
                //         }
                //       },
                //     );
                //   },
                // ),

                //),
              ]))
            : Text("Something went wrong"),
      ),
    );
  }
}
