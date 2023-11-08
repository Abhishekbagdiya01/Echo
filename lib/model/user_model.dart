class UserModel {
  final String? firstName;
  final String? lastName;
  final String? ageGroup;
  final String? gender;
  final String? username;
  final String? email;
  final String? password;

  UserModel({
    this.firstName,
    this.lastName,
    this.ageGroup,
    this.gender,
    this.username,
    this.email,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      ageGroup: json['ageGroup'],
      gender: json['gender'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'ageGroup': ageGroup,
      'gender': gender,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
