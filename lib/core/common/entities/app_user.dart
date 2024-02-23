import 'dart:convert';

import 'package:unitedfoodindustery/presentation/screens/authantication/login/data/login_model.dart';




class AppUser {
  final String id;
  final bool emailConfirmed;
  final String username;
  final String email;
  final String phoneNumber;
  final String token;

  AppUser({
    required this.id,
    required this.emailConfirmed,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.token,
  });

  factory AppUser.fromJson(String str) => AppUser.fromMap(json.decode(str));

  factory AppUser.fromLoginResponse(LoginResponse response) {
    final resultData = response.result;
    return AppUser(
      token: resultData.token,
      id: resultData.id,
      email: resultData.email,
      emailConfirmed: resultData.emailConfirmed,
      phoneNumber: resultData.phoneNumber,
      username: resultData.fullName,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromMap(Map<String, dynamic> json) => AppUser(
    id: json["id"],
    emailConfirmed: json["emailConfirmed"],
    username: json["fullName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "emailConfirmed": emailConfirmed,
    "fullName": username,
    "email": email,
    "phoneNumber": phoneNumber,
    "token": token,
  };

}