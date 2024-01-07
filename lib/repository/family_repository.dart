import 'dart:convert';

import 'package:echo/repository/server_exception.dart';
import 'package:echo/utils/utils.dart';
import 'package:http/http.dart' as http;

class FamilyRepository {
  http.Client client = http.Client();

  // Create Family Room
  createFamilyRoom(
      String token, String uid, String accessKey, String familyName) async {
    final response = await client.post(
        Uri.parse(
          endPoint("createFamilyRoom"),
        ),
        headers: {
          'Authorization': 'Bearer $token'
        },
        body: {
          "userId": uid,
          "accessKey": accessKey,
          "familyName": familyName
        });
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body)["message"];
    } else {
      print(jsonDecode(response.body)["error"]);
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  // getFamilyList
  getFamilyList(
    String token,
    String uid,
    String accessKey,
    String familyName,
  ) async {
    final response = await client.get(
      Uri.parse(
        endPoint("getFamilyList/6575780a866bb3b3c6bbfdd4"),
      ),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body)["message"];
    } else {
      print(jsonDecode(response.body)["error"]);
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  // Join Family Room
  joinFamilyRoom(
      String token, String uid, String accessKey, String familyName) async {
    final response = await client.post(
        Uri.parse(
          endPoint("joinFamilyRoom"),
        ),
        headers: {
          'Authorization': 'Bearer $token'
        },
        body: {
          "userId": uid,
          "accessKey": accessKey,
          "familyName": familyName
        });
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body)["message"];
    } else {
      print(jsonDecode(response.body)["error"]);
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  //getFamilyById
  getFamilyById(
    String token,
    String uid,
  ) async {
    final response = await client.get(
      Uri.parse(
        endPoint("getFamilyById/65757799866bb3b3c6bbfdcf"),
      ),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body)["message"];
    } else {
      print(jsonDecode(response.body)["error"]);
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  // Create Family Post
  createFamilyPost(String token, String uid, String accessKey,
      String familyName, String content, String familyRoomId) async {
    final response = await client.post(
        Uri.parse(
          endPoint("createFamilyPost"),
        ),
        headers: {
          'Authorization': 'Bearer $token'
        },
        body: {
          "userId": uid,
          "accessKey": accessKey,
          "familyName": familyName
        });
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body)["message"];
    } else {
      print(jsonDecode(response.body)["error"]);
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  // Get All Family Post
  getAllFamilyPost(String token, String uid, String accessKey,
      String familyName, String content, String familyRoomId) async {
    final response = await client.get(
      Uri.parse(
        endPoint("getAllFamilyPost"),
      ),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body)["message"];
    } else {
      print(jsonDecode(response.body)["error"]);
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  // Get Family Members
  getFamilyMembers(String token, String uid, String accessKey,
      String familyName, String content, String familyRoomId) async {
    final response = await client.get(
      Uri.parse(
        endPoint("getFamilyMembers/65759bb4a603e753fe13ec6e"),
      ),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body)["message"];
    } else {
      print(jsonDecode(response.body)["error"]);
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  // Remove Family Member
  removeFamilyMember(String token, String uid, String familyRoomId,
      String memberToRemove) async {
    final response = await client.delete(
        Uri.parse(
          endPoint("removeFamilyMember"),
        ),
        headers: {
          'Authorization': 'Bearer $token'
        },
        body: {
          "familyId": familyRoomId,
          "userId": uid,
          "removeId": memberToRemove
        });
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body)["message"];
    } else {
      print(jsonDecode(response.body)["error"]);
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  //updateFamilyName
  updateFamilyName(
      String token, String familyRoomId, String newFamilyRoomName) async {
    final response = await client.put(
        Uri.parse(
          endPoint("updateFamilyName"),
        ),
        headers: {'Authorization': 'Bearer $token'},
        body: {"familyId": familyRoomId, "newName": newFamilyRoomName});
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body)["message"];
    } else {
      print(jsonDecode(response.body)["error"]);
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }

  //Delete Family
  deleteFamily(String token, String familyRoomId, String uid) async {
    final response = await client.delete(
        Uri.parse(
          endPoint("deleteFamily"),
        ),
        headers: {'Authorization': 'Bearer $token'},
        body: {"familyId": familyRoomId, "userId": uid});
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body)["message"];
    } else {
      print(jsonDecode(response.body)["error"]);
      throw ServerException(errorMessage: jsonDecode(response.body)["error"]);
    }
  }
}
