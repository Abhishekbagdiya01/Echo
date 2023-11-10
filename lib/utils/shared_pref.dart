import 'package:shared_preferences/shared_preferences.dart';

String currentUserId = "currentUserId";

class SharedPref {
  void setUid(String uid) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(currentUserId, uid);
  }

  Future<String?> getUid() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(currentUserId);
  }
}
