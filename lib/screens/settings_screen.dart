import 'package:echo/route/page_const.dart';
import 'package:echo/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Logout",
            ),
            leading: Icon(Icons.logout),
            onTap: () {
              SharedPref().setUid("");
              Navigator.pushReplacementNamed(context, PageConst.LoginScreen);
            },
          ),
        ],
      ),
    );
  }
}
