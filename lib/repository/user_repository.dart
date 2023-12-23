import 'dart:convert';

import 'package:echo/repository/server_exception.dart';
import 'package:echo/utils/utils.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  http.Client client = http.Client();

  Future getUserById(uid) async {
    final response =
        await client.get(Uri.parse(endPoint(endPoint("/getUserByID/$uid"))));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)['error']);
    }
  }
}
