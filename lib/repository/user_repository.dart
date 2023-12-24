import 'dart:convert';
import 'dart:developer';

import 'package:echo/model/user_model.dart';
import 'package:echo/repository/server_exception.dart';
import 'package:echo/utils/utils.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  http.Client client = http.Client();

  Future<UserDataModel> getUserById(uid, token) async {
    log("$uid");
    print(endPoint("getUserByID/$uid"));
    final response = await client.get(Uri.parse(endPoint("getUserByID/$uid")),
        headers: {'Authorization': 'Bearer $token'});
    log(response.body);
    if (response.statusCode == 200) {
      log(response.body);
      return UserDataModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)['error']);
    }
  }

  Future searchUserByName(String userName, token) async {
    final response = await client.post(
        Uri.parse(endPoint("searchUser/?search=$userName")),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
    } else {}
  }

  followUser(currentUserUid, userToFollowId, token) async {
    final response = await client.post(
        Uri.parse(endPoint("$currentUserUid/$userToFollowId")),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)['message']);
    }
  }
}
