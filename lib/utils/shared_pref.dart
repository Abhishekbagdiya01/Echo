import 'package:shared_preferences/shared_preferences.dart';

String currentUserId = "currentUserId";
String currentRefreshToken = "refreshToken";

class SharedPref {
  //set uid
  void setUid(String uid) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(currentUserId, uid);
  }

  //get uid
  Future<String?> getUid() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(currentUserId);
  }

  //set RefreshToken
  void setRefreshToken(String refreshToken) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(currentRefreshToken, refreshToken);
  }

  //get RefreshToken
  Future<String?> getRefreshToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(currentRefreshToken);
  }
}
