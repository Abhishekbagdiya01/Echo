import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String firstName;
  final String lastName;
  final String ageGroup;
  final String gender;
  final String username;
  final String email;
  final String password;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.ageGroup,
    required this.gender,
    required this.username,
    required this.email,
    required this.password,
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

  @override
  List<Object> get props {
    return [
      firstName,
      lastName,
      ageGroup,
      gender,
      username,
      email,
      password,
    ];
  }
}
