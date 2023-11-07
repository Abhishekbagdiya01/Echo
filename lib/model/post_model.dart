import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  String username;
  String profileUrl;
  String location;
  int likesCount;
  String postType;
  PostModel({
    required this.username,
    required this.profileUrl,
    required this.location,
    required this.likesCount,
    required this.postType,
  });

  factory PostModel.fromJson(Map<String, dynamic> map) {
    return PostModel(
        username: map["username"],
        profileUrl: map["profileUrl"],
        location: map["location"],
        likesCount: map["likesCount"],
        postType: map["postType"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "profileUrl": profileUrl,
      "location": location,
      "likesCount": likesCount,
      "postType": postType,
    };
  }

  @override
  List<Object> get props {
    return [
      username,
      profileUrl,
      location,
      likesCount,
      postType,
    ];
  }
}
