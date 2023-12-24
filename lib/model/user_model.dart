class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? ageGroup;
  String? gender;
  String? username;
  String? email;
  String? password;

  UserModel(
      {this.uid,
      this.firstName,
      this.lastName,
      this.ageGroup,
      this.gender,
      this.username,
      this.email,
      this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    ageGroup = json['ageGroup'];
    gender = json['gender'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.uid;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['ageGroup'] = this.ageGroup;
    data['gender'] = this.gender;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;

    return data;
  }
}

// ----------------------------------------------------

class UserDataModel {
  UserDataModel({
    required this.firstName,
    required this.lastName,
    required this.ageGroup,
    required this.gender,
    required this.username,
    required this.email,
    required this.profileImage,
    required this.followers,
    required this.following,
    required this.otp,
    required this.notifications,
    required this.posts,
  });
  late final String firstName;
  late final String lastName;
  late final String ageGroup;
  late final String gender;
  late final String username;
  late final String email;
  late final String profileImage;
  late final List<dynamic> followers;
  late final List<dynamic> following;
  late final String otp;
  late final List<dynamic> notifications;
  late final Posts posts;

  UserDataModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    ageGroup = json['ageGroup'];
    gender = json['gender'];
    username = json['username'];
    email = json['email'];
    profileImage = json['profileImage'];
    followers = List.castFrom<dynamic, dynamic>(json['followers']);
    following = List.castFrom<dynamic, dynamic>(json['following']);
    otp = json['otp'];
    notifications = List.castFrom<dynamic, dynamic>(json['notifications']);
    posts = Posts.fromJson(json['posts']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['ageGroup'] = ageGroup;
    _data['gender'] = gender;
    _data['username'] = username;
    _data['email'] = email;
    _data['profileImage'] = profileImage;
    _data['followers'] = followers;
    _data['following'] = following;
    _data['otp'] = otp;
    _data['notifications'] = notifications;
    _data['posts'] = posts.toJson();
    return _data;
  }
}

class Posts {
  Posts({
    required this.audio,
    required this.text,
  });
  late final List<dynamic> audio;
  late final List<dynamic> text;

  Posts.fromJson(Map<String, dynamic> json) {
    audio = List.castFrom<dynamic, dynamic>(json['audio']);
    text = List.castFrom<dynamic, dynamic>(json['text']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['audio'] = audio;
    _data['text'] = text;
    return _data;
  }
}
