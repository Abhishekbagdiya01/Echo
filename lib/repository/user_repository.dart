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
      throw ServerException(errorMessage: jsonDecode(response.body)['message']);
    }
  }

  Future searchUserByName(String userName, token) async {
    final response = await client.get(
        Uri.parse(endPoint("searchUser/?search=$userName")),
        headers: {'Authorization': 'Bearer $token'});
    log(endPoint("searchUser/?search=$userName"));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body));
    }
  }

//Follow user
  followUser(currentUserUid, userToFollowId, token) async {
    final response = await client.post(
        Uri.parse(endPoint("follow/$currentUserUid/$userToFollowId")),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['message']);
      return jsonDecode(response.body)['message'];
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)['message']);
    }
  }

//Unfollow user

  unFollowUser(currentUserUid, userToUnfollowId, token) async {
    final response = await client.post(
        Uri.parse(endPoint("unfollow/$currentUserUid/$userToUnfollowId")),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['message']);
      return jsonDecode(response.body)['message'];
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)['message']);
    }
  }

// Fetch followers
  Future<List<UserDataModel>> fetchFollowers(
      {required List followerUid, token}) async {
    List<UserDataModel> followerList = [];

    for (var i = 0; i < followerUid.length; i++) {
      final user = await getUserById(followerUid[i], token);
      followerList.add(user);
      print("FetchFollowers: ${followerList[i].username}");
    }

    return followerList;
  }

// fetch following

  Future<List> fetchFollowing(
      {required List followingUid, required token}) async {
    List<UserDataModel> followingList = [];

    for (var i = 0; i < followingUid.length; i++) {
      final user = await getUserById(followingUid[i], token);
      followingList.add(user);
      print("FetchFollowers: ${followingList[i].username}");
    }

    return followingList;
  }

  //Upload profile picture

  uploadProfilePicture(String uid, String imagePath, token) async {
    log("image path : $imagePath");

    final response = await client.put(
        Uri.parse(
          endPoint("uploadImg/$uid"),
        ),
        headers: {'Authorization': 'Bearer $token'},
        body: {"filePath": imagePath});

    if (response.statusCode == 200) {
      jsonDecode(response.body)["message"];
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  //Upload profile picture

  // deleteProfileImage(String uid, String token) async {
  //   final response = await client.delete(
  //       Uri.parse(
  //         endPoint("deleteProfilePhoto/$uid"),
  //       ),
  //       headers: {'Authorization': 'Bearer $token'});
  //   print(jsonDecode(response.body));
  //   if (response.statusCode == 200) {
  //     print(jsonDecode(response.body));
  //   } else {
  //     throw ServerException(errorMessage: jsonDecode(response.body)['error']);
  //   }
  // }

// Extract user details from list of uid's
  Future<List<UserDataModel>> fetchUserDetailByUid(
      List listOfUid, token) async {
    List<UserDataModel> userList = [];
    for (var i = 0; i < listOfUid.length; i++) {
      final user = await getUserById(listOfUid[i], token);
      userList.add(user);
      print("FetchFollowers: ${userList[i].username}");
    }
    return userList;
  }
}
