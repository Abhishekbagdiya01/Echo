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
