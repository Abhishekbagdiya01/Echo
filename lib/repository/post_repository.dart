import 'dart:convert';

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
      return jsonDecode(response.body)['message'];
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)['error']);
    }
  }

  //deletePost
  deletePost(String uid, String postId, String token) async {
    final response = await client.post(
      Uri.parse(
        endPoint("deletePost/$postId"),
      ),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)['error']);
    }
  }

//getAllPost
  fetchAllPost(String uid, String token) async {
    final response = await client.post(
      Uri.parse(
        endPoint("getAllPost/$uid?page=1"),
      ),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
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

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      throw ServerException(errorMessage: jsonDecode(response.body)['error']);
    }
  }

  //unlikePost
  unlikePost(String uid, String postId, String token) async {
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
      throw ServerException(errorMessage: jsonDecode(response.body)['error']);
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
}
