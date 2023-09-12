import 'package:echo/utils/global_variables.dart';
import 'package:echo/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 5,
          shadowColor: Colors.black,
          title: Text(
            "Hi,Abhishek",
            style:
                GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                icon: Image.asset("assets/images/add_post_icon.png"),
                onPressed: () {}),
            IconButton(
                icon: Image.asset("assets/images/chat_icon.png"),
                onPressed: () {}),
          ],
        ),
        body: SafeArea(
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: dummyData.length,
            itemBuilder: (context, index) {
              return postCard(
                  username: dummyData[index]["name"],
                  location: dummyData[index]["location"],
                  postType: dummyData[index]["postType"],
                  content: dummyData[index]["content"]);
            },
          ),
        ));
  }
}
