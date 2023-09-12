import 'package:echo/utils/colors.dart';
import 'package:echo/widgets/post_card.dart';
import 'package:echo/widgets/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQt5UNMp6k30E5NpJ2mj0XG22WDOot8OPCV8HSPpOVzfJoV786vphcmZlJetw_IvpR15rY&usqp=CAU"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Abhishek",
                    style: interTextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "@Abhishek",
                    style: interTextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "300",
                            style: interTextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Follower",
                            style: interTextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "150",
                            style: interTextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Following",
                            style: interTextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),

            //POST SELECTION

            TabBar(tabs: [
              Tab(
                child: Text(
                  "Audio",
                  style:
                      interTextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "Text",
                  style:
                      interTextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            ]),
            SizedBox(
              height: 10,
            ),
            // POST

            Expanded(
                child: TabBarView(children: [
              postCard(
                  username: "Abhishek",
                  location: "Blue City",
                  content: "",
                  postType: "Audio"),
              postCard(
                  username: "Abhishek",
                  location: "Jodhpur",
                  content:
                      "Yeh jo has rahi hai duniya meri naakamiyon pe , Taane kas rahi hai duniya meri naadaniyon pe Par main kaam kar raha hoon meri saari khaamiyon pe Kal yeh maarenge taali meri kahaniyon pe Kal jo badlegi hava, yeh saale sharmayenge Humare apne ho,” keh ke yeh baahein garmayenge",
                  postType: "Text")
            ]))
          ],
        ),
      ),
    );
  }
}
