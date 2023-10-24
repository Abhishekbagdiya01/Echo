import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQt5UNMp6k30E5NpJ2mj0XG22WDOot8OPCV8HSPpOVzfJoV786vphcmZlJetw_IvpR15rY&usqp=CAU"),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Joshep joestar ",
                        style: TextStyle(fontSize: 22, color: Colors.black)),
                    TextSpan(
                        text: "like your post ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.6))),
                    TextSpan(
                        text: "1h ago.",
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ]))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQt5UNMp6k30E5NpJ2mj0XG22WDOot8OPCV8HSPpOVzfJoV786vphcmZlJetw_IvpR15rY&usqp=CAU"),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Joshep joestar ",
                        style: TextStyle(fontSize: 22, color: Colors.black)),
                    TextSpan(
                        text: "like your post ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.6))),
                    TextSpan(
                        text: "1h ago.",
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ]))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQt5UNMp6k30E5NpJ2mj0XG22WDOot8OPCV8HSPpOVzfJoV786vphcmZlJetw_IvpR15rY&usqp=CAU"),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Joshep joestar ",
                        style: TextStyle(fontSize: 22, color: Colors.black)),
                    TextSpan(
                        text: "like your post ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.6))),
                    TextSpan(
                        text: "1h ago.",
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ]))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
