import 'dart:convert';
import 'dart:developer';

import 'package:echo/model/user_model.dart';
import 'package:http/http.dart' as http;

class ServerException implements Exception {
  String errorMessage;
  ServerException({
    required this.errorMessage,
  });
}

class AuthRepository {
  http.Client client = http.Client();

  String _endPoint(String endPoint) {
    return "http://192.168.123.6:5000/api/$endPoint";
  }

  Map<String, String> _header = {
    "Content-Type": "application/json; charset=utf-8"
  };

  Future<UserModel> signUp(UserModel userModel) async {
    final encodedParam = jsonEncode(userModel);

    final response = await client.post(Uri.parse(_endPoint("signUp")),
        body: encodedParam, headers: _header);

    if (response.statusCode == 200) {
      final user = UserModel.fromJson(jsonDecode(response.body)['user']);

      return user;
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  Future<UserModel> logIn(UserModel userModel) async {
    final encodedParam = jsonEncode(userModel);
    final url = _endPoint("login");

    final response =
        await client.post(Uri.parse(url), body: encodedParam, headers: _header);

    if (response.statusCode == 200) {
      final user = UserModel.fromJson(jsonDecode(response.body)['user']);

      return user;
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  Future<String> forgotPassword(String email) async {
    final encodedParam = jsonEncode({"email": email});
    final response = await client.post(Uri.parse(_endPoint("forgotPassword")),
        body: encodedParam, headers: _header);

    if (response.statusCode == 200) {
      log(jsonDecode(response.body)["message"]);
      return jsonDecode(response.body)["message"];
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  Future<String> verifyOtp(String email, String otp) async {
    final encodedParam = jsonEncode({"email": email, "otp": otp});
    final response = await client.post(Uri.parse(_endPoint("verifyOTP")),
        body: encodedParam, headers: _header);

    if (response.statusCode == 200) {
      log(jsonDecode(response.body)["message"]);
      return jsonDecode(response.body)["message"];
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  Future<String> resetPassword(String email, String password) async {
    final encodedParam = jsonEncode({"email": email, "newPassword": password});
    final response = await client.post(Uri.parse(_endPoint("resetPassword")),
        body: encodedParam, headers: _header);

    if (response.statusCode == 200) {
      log(jsonDecode(response.body)["message"]);
      return jsonDecode(response.body)["message"];
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }
}
