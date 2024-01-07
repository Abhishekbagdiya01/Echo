class PostModel {
  String username;
  String firstName;
  String lastName;
  String profileImage;
  bool isFollowed;
  String postId;
  String content;
  String audioPath;
  List<dynamic> likes;
  List<String> comments;
  String createdAt;

  PostModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.profileImage,
    required this.isFollowed,
    required this.postId,
    required this.content,
    required this.audioPath,
    required this.likes,
    required this.comments,
    required this.createdAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      username: json['username'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      profileImage: json['profileImage'] ?? '',
      isFollowed: json['isFollowed'] ?? false,
      postId: json['postId'] ?? '',
      content: json['content'] ?? '',
      audioPath: json['audioPath'] ?? '',
      likes: json['likes'] ?? [],
      comments: List<String>.from(json['comments'] ?? []),
      createdAt: json['createdAt'] ?? '',
    );
  }
}

class PostsResponse {
  List<PostModel> posts;
  int current;
  int total;

  PostsResponse({
    required this.posts,
    required this.current,
    required this.total,
  });

  factory PostsResponse.fromJson(Map<String, dynamic> json) {
    List<PostModel> posts = <PostModel>[];
    if (json['posts'] != null) {
      json['posts'].forEach((v) {
        posts.add(PostModel.fromJson(v));
      });
    }
    return PostsResponse(
      posts: posts,
      current: json['current'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}
