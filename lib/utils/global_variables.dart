import 'package:echo/screens/home_screen.dart';
import 'package:echo/screens/notification_screen.dart';
import 'package:echo/screens/profile_screen.dart';
import 'package:echo/screens/search_screen.dart';
import 'package:flutter/material.dart';

List<Widget> bottomNavBarItems = [
  HomeScreen(),
  SearchScreen(),
  NotificationScreen(),
  ProfileScreen()
];

List<Map<String, dynamic>> dummyData = [
  {
    "name": "Geralt",
    "location": "Kaer Morhen",
    "postType": "Text",
    "content":
        "The Witcher is a fantasy series set in a medieval world where humans, elves, dwarves, and other creatures coexist. The story follows Geralt of Rivia, a witcher, a mutated monster hunter who is hired to slay creatures that threaten the people of the realm."
  },
  {
    "name": "Abhishek",
    "location": "Jodhpur",
    "postType": "Text",
    "content":
        "Reading is a fundamental skill that is essential for success in school, work, and life. It is the key to accessing information, learning new things, and developing critical thinking skills. Reading also helps us to connect with others, understand different cultures, and appreciate the world around us"
  },
  {
    "name": "Rahgir",
    "location": "Agra",
    "postType": "Text",
    "content":
        "Yeh jo has rahi hai duniya meri naakamiyon pe , Taane kas rahi hai duniya meri naadaniyon pe Par main kaam kar raha hoon meri saari khaamiyon pe Kal yeh maarenge taali meri kahaniyon pe Kal jo badlegi hava, yeh saale sharmayenge Humare apne ho,” keh ke yeh baahein garmayenge"
  },
  {
    "name": "Abhishek",
    "location": "Jodhpur",
    "postType": "Audio",
    "content": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
  },
  {
    "name": "Geralt",
    "location": "Kaer Morhen",
    "postType": "Text",
    "content":
        "The Witcher is a fantasy series set in a medieval world where humans, elves, dwarves, and other creatures coexist. The story follows Geralt of Rivia, a witcher, a mutated monster hunter who is hired to slay creatures that threaten the people of the realm."
  },
  {
    "name": "Abhishek",
    "location": "Jodhpur",
    "postType": "Audio",
    "content": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
  },
];
