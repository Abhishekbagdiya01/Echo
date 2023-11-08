import 'dart:convert';

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

  Future signUp(UserModel userModel) async {
    final encodedParam = jsonEncode(userModel);

    final response = await client.post(Uri.parse(_endPoint("signUp")),
        body: encodedParam, headers: _header);

    if (response.statusCode == 200) {
      final user = UserModel.fromJson(jsonDecode(response.body)["message"]);

      return user;
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  Future logIn(UserModel userModel) async {
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

  Future forgotPassword(UserModel userModel) async {
    final encodedParam = jsonEncode(userModel);
    final response = await client.post(Uri.parse("forgotPassword"),
        body: encodedParam, headers: _header);

    if (response.statusCode == 200) {
      final user = UserModel.fromJson(jsonDecode(response.body)["message"]);
      return user;
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }
}
