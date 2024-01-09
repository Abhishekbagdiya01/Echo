import 'dart:convert';
import 'dart:developer';

import 'package:echo/repository/server_exception.dart';
import 'package:echo/utils/utils.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  http.Client client = http.Client();

//create post
  createPost(String uid, String postType, String audioPath, String token,
      String content) async {
    final response = await client.post(
        Uri.parse(
          endPoint("createPost"),
        ),
        headers: {
          'Authorization': 'Bearer $token'
        },
        body: {
          "userId": uid,
          "content": content,
          "type": postType,
          "filePath": audioPath
        });

    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['message']);
      return jsonDecode(response.body)['message'];
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)['error']);
    }
  }

  //deletePost
  deletePost(String postId, String token) async {
    log("POSTID : $postId");
    final response = await client.delete(
      Uri.parse(
        endPoint("deletePost/$postId"),
      ),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      print(jsonDecode(response.body)['error']);
      //throw ServerException(errorMessage: jsonDecode(response.body)['error']);
    }
  }

//getAllPost
  fetchAllPost(String uid, String token) async {
    final response = await client.get(
      Uri.parse(
        endPoint("getAllPost/$uid?page=1"),
      ),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      print("HomeScreen : ${jsonDecode(response.body)['posts']}");
      return jsonDecode(response.body)['posts'];
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)['error']);
    }
  }

//Like post
  likePost(String uid, String postId, String token) async {
    final response = await client.post(
        Uri.parse(
          endPoint("likePost/$postId"),
        ),
        headers: {
          'Authorization': 'Bearer $token'
        },
        body: {
          "userId": uid,
        });
    log(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      print(jsonDecode(response.body)['error']);
      // throw ServerException(errorMessage: jsonDecode(response.body)['error']);
    }
  }

  //unlikePost
  dislikePost(String uid, String postId, String token) async {
    final response = await client.post(
        Uri.parse(
          endPoint("unlikePost/$postId"),
        ),
        headers: {
          'Authorization': 'Bearer $token'
        },
        body: {
          "userId": uid,
        });

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      log(jsonDecode(response.body)['error']);
      // throw ServerException(errorMessage: jsonDecode(response.body)['error']);
    }
  }

  //Add post comment
  postComment(String uid, String postId, String token, String comment) async {
    final response = await client.post(
        Uri.parse(
          endPoint("commentPost/$postId"),
        ),
        headers: {'Authorization': 'Bearer $token'},
        body: {"userId": uid, "text": comment});

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)['error']);
    }
  }
  //getComment/659a66e8b33c2c8a719fae6e

  getAllComments(String uid, String postId, String token) async {
    final response = await client.get(
      Uri.parse(
        endPoint("getComment/$postId"),
      ),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)['error']);
    }
  }

  //deletePostComment
  deletePostComment(
      String uid, String postId, String token, String comment) async {
    final response = await client.post(
      Uri.parse(
        endPoint("deletePostComment/$uid/$postId"),
      ),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)['error']);
    }
  }

  //Notification
  getNotifications(String uid, String token) async {
    final response = await client.get(
      Uri.parse(
        endPoint("notification/$uid"),
      ),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['notification'];
    } else {
      print(jsonDecode(response.body)['error']);
      // throw ServerException(errorMessage: jsonDecode(response.body)['error']);
    }
  }
}
