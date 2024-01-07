import 'dart:convert';
import 'dart:developer';

import 'package:echo/model/user_model.dart';
import 'package:echo/repository/server_exception.dart';
import 'package:echo/utils/shared_pref.dart';
import 'package:echo/utils/utils.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  http.Client client = http.Client();

  Future<String> signUp(
    UserModel userModel,
  ) async {
    print(
        "${userModel.firstName} || ${userModel.lastName} ||${userModel.ageGroup} ||${userModel.gender} ||${userModel.username} || ${userModel.email} ||${userModel.password} || ");
    final encodedParam = jsonEncode({
      "firstName": userModel.firstName,
      "lastName": userModel.lastName,
      "ageGroup": userModel.ageGroup,
      "gender": userModel.gender,
      "username": userModel.username,
      "email": userModel.email,
      "password": userModel.password
    });

    final response = await client.post(Uri.parse(endPoint("signUp")),
        body: encodedParam, headers: header);
    log(response.body);
    if (response.statusCode == 200) {
      final userId = jsonDecode(response.body)['id'];

      return userId;
    } else {
      print(jsonDecode(response.body)["error"]);
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  Future<String> logIn(UserModel userModel) async {
    final encodedParam = jsonEncode(userModel);
    final url = endPoint("login");

    final response =
        await client.post(Uri.parse(url), body: encodedParam, headers: header);

    if (response.statusCode == 200) {
      String id = await jsonDecode(response.body)['id'];
      log("UserId : $id");
      String refreshToken = await jsonDecode(response.body)['refreshToken'];
      SharedPref().setRefreshToken(refreshToken);
      log("RefreshToken : $refreshToken");

      return id;
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  Future<String> forgotPassword(String email) async {
    final encodedParam = jsonEncode({"email": email});
    final response = await client.post(Uri.parse(endPoint("forgotPassword")),
        body: encodedParam, headers: header);

    if (response.statusCode == 200) {
      log(jsonDecode(response.body)["message"]);
      return jsonDecode(response.body)["message"];
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  Future verifyOtp(String email, String otp) async {
    final encodedParam = jsonEncode({"email": email, "otp": otp});
    final response = await client.post(Uri.parse(endPoint("verifyOTP")),
        body: encodedParam, headers: header);

    if (response.statusCode == 200) {
      // log(jsonDecode(response.body)["message"]);
      String msg = await jsonDecode(response.body)["message"];
      return msg;
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  Future<String> resetPassword(String email, String newPassword) async {
    final encodedParam =
        jsonEncode({"email": email, "newPassword": newPassword});
    final response = await client.post(Uri.parse(endPoint("resetPassword")),
        body: encodedParam, headers: header);

    if (response.statusCode == 200) {
      String message = jsonDecode(response.body)["message"];
      log(message);
      return message;
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }
}
