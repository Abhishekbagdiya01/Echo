import 'dart:developer';

import 'package:echo/bloc/user_bloc/user_bloc_bloc.dart';
import 'package:echo/model/user_model.dart';
import 'package:echo/utils/colors.dart';
import 'package:echo/utils/shared_pref.dart';
import 'package:echo/widgets/custom_button.dart';
import 'package:echo/widgets/post_card.dart';
import 'package:echo/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({this.uid, super.key});

  String? uid;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    getUserById();
    currUserUid();
  }

  String? currentUserId;
  late String token;
  currUserUid() async {
    currentUserId = (await SharedPref().getUid())!;
  }

  getUserById() async {
    token = (await SharedPref().getRefreshToken())!;
    if (widget.uid == null) {
      String uid = (await SharedPref().getUid())!;

      log("UID : $uid   || Token : $token");
      BlocProvider.of<UserBloc>(context)
          .add(GetUserDataEvent(uid: uid, token: token));
    } else {
      BlocProvider.of<UserBloc>(context)
          .add(GetUserDataEvent(uid: widget.uid!, token: token));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserBlocState>(
      builder: (context, state) {
        if (state is UserBlocLoadingState) {
          return CircularProgressIndicator();
        } else if (state is UserBlocLoadedState) {
          UserDataModel user = state.userData;
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  // PROFILE CARD
                  Container(
                    height: MediaQuery.sizeOf(context).height * .5,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [BoxShadow(color: goldenThemeColor)]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 90,
                          // backgroundImage: NetworkImage(
                          //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQt5UNMp6k30E5NpJ2mj0XG22WDOot8OPCV8HSPpOVzfJoV786vphcmZlJetw_IvpR15rY&usqp=CAU"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${user.firstName} ${user.lastName}",
                          style: interTextStyle(
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "@${user.username}",
                          style: interTextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        user.followers!.contains(currentUserId)
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "${user.followers!.length}",
                                        style: interTextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Follower",
                                        style: interTextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "${user.following!.length}",
                                        style: interTextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Following",
                                        style: interTextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              )
                            : CustomButton(
                                voidCallback: () async {
                                  BlocProvider.of<UserBloc>(context).add(
                                      FollowUserEvent(
                                          currentUserId: currentUserId!,
                                          userToFollowId: widget.uid!,
                                          token: token));
                                },
                                title: "Follow"),
                        user.followers!.contains(currentUserId)
                            ? Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                      width: 100,
                                      height: 50,
                                      child: CustomButton(
                                          voidCallback: () {
                                            BlocProvider.of<UserBloc>(context)
                                                .add(UnfollowUserEvent(
                                                    currentUserId:
                                                        currentUserId!,
                                                    userToUnfollowId:
                                                        widget.uid!,
                                                    token: token));

                                            log("Hello");
                                          },
                                          title: "Unfollow")),
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),

                  //POST SELECTION

                  TabBar(tabs: [
                    Tab(
                      child: Text(
                        "Audio",
                        style: interTextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Text",
                        style: interTextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  // POST

                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          postCard(
                              username: "Abhishek",
                              profileUrl:
                                  "data:image/jpeg;base64,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",
                              location: "Blue City",
                              content: "",
                              postType: "Audio"),
                          ListView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              postCard(
                                  username: "Abhishek",
                                  profileUrl:
                                      "data:image/jpeg;base64,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",
                                  location: "Jodhpur",
                                  content:
                                      "Yeh jo has rahi hai duniya meri naakamiyon pe , Taane kas rahi hai duniya meri naadaniyon pe Par main kaam kar raha hoon meri saari khaamiyon pe Kal yeh maarenge taali meri kahaniyon pe Kal jo badlegi hava, yeh saale sharmayenge Humare apne ho,” keh ke yeh baahein garmayenge",
                                  postType: "Text"),
                            ],
                          )
                        ]),
                  ))
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
