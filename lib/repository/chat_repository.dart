import 'dart:convert';

import 'package:echo/utils/utils.dart';
import 'package:http/http.dart' as http;

class ChatRepository {
  http.Client client = http.Client();
  //sendMessage
  sendMessage(
      String uid, String receiverId, String token, String message) async {
    final response = await client.post(
        Uri.parse(
          endPoint("sendMessage"),
        ),
        headers: {'Authorization': 'Bearer $token'},
        body: {"senderId": uid, "receiverId": receiverId, "message": message});

    if (response.statusCode == 200) {
      print(jsonDecode(response.body)["roomId"]);
      return jsonDecode(response.body)["roomId"];
    } else {
      print(jsonDecode(response.body)["error"]);
    }
  }

  //getAllRooms
  getChatRoom(String uid, String token) async {
    final response = await client.get(
      Uri.parse(
        endPoint("getAllRooms/$uid"),
      ),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      print(jsonDecode(response.body)["error"]);
    }
  }

  //get message
  getMessage({required String roomId, required String token}) async {
    final response = await client.get(
      Uri.parse(
        endPoint("getMessage/$roomId"),
      ),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      print(jsonDecode(response.body)["error"]);
    }
  }
}
