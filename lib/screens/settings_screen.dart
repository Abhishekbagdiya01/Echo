import 'package:echo/repository/user_repository.dart';
import 'package:echo/route/page_const.dart';
import 'package:echo/utils/shared_pref.dart';
import 'package:echo/widgets/snackbar.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({required this.uid, required this.token, super.key});
  String uid;
  String token;
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
              "Delete account",
            ),
            leading: Icon(Icons.account_box),
            onTap: () async {
              final response = await UserRepository().deleteUser(uid, token);
              if (response != null) {
                snackbarMessenger(context, response);
                SharedPref().setUid("");
                Navigator.pushReplacementNamed(context, PageConst.LoginScreen);
              }
            },
          ),
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
