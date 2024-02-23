import 'dart:convert';

import 'package:flutter/foundation.dart';

class LoginResponse {
  final int statusCode;
  final String timestamp;
  final bool isError;
  final String description;
  final LoginResponseData result;

  LoginResponse({
    required this.statusCode,
    required this.timestamp,
    required this.isError,
    required this.description,
    required this.result,
  });

  LoginResponse copyWith({
    int? statusCode,
    String? timestamp,
    bool? isError,
    String? description,
    LoginResponseData? result,
  }) {
    return LoginResponse(
      statusCode: statusCode ?? this.statusCode,
      timestamp: timestamp ?? this.timestamp,
      isError: isError ?? this.isError,
      description: description ?? this.description,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'statusCode': statusCode,
      'timestamp': timestamp,
      'isError': isError,
      'description': description,
      'result': result.toMap(),
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      statusCode: map['statusCode']?.toInt() ?? 0,
      timestamp: map['timestamp'] ?? '',
      isError: map['isError'] ?? false,
      description: map['description'] ?? '',
      result: LoginResponseData.fromMap(map['result']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AuthModel(statusCode: $statusCode, timestamp: $timestamp, isError: $isError, message: $description, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginResponse &&
        other.statusCode == statusCode &&
        other.timestamp == timestamp &&
        other.isError == isError &&
        other.description == description &&
        other.result == result;
  }

  @override
  int get hashCode {
    return statusCode.hashCode ^
        timestamp.hashCode ^
        isError.hashCode ^
        description.hashCode ^
        result.hashCode;
  }
}

class LoginResponseData {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String userName;
  final String password;
  final String phoneNumber;
  final bool emailConfirmed;
  final List<String> roles;
  final String token;
  final String imageUrl;
  final String socialLoginId;
  final String dateAdded;
  final String fullName;
  final List<Brands> brands;

  const LoginResponseData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userName,
    required this.password,
    required this.phoneNumber,
    required this.emailConfirmed,
    required this.roles,
    required this.token,
    required this.imageUrl,
    required this.socialLoginId,
    required this.dateAdded,
    required this.fullName,
    required this.brands,
  });

  LoginResponseData copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? userName,
    String? password,
    String? phoneNumber,
    bool? emailConfirmed,
    List<String>? roles,
    String? token,
    String? imageUrl,
    String? socialLoginId,
    String? dateAdded,
    String? fullName,
    List<Brands>? brands,
  }) {
    return LoginResponseData(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailConfirmed: emailConfirmed ?? this.emailConfirmed,
      roles: roles ?? this.roles,
      token: token ?? this.token,
      imageUrl: imageUrl ?? this.imageUrl,
      socialLoginId: socialLoginId ?? this.socialLoginId,
      dateAdded: dateAdded ?? this.dateAdded,
      fullName: fullName ?? this.fullName,
      brands: brands ?? this.brands,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'userName': userName,
      'password': password,
      'phoneNumber': phoneNumber,
      'emailConfirmed': emailConfirmed,
      'roles': roles,
      'token': token,
      'imageUrl': imageUrl,
      'socialLoginId': socialLoginId,
      'dateAdded': dateAdded,
      'fullName': fullName,
      'brands': brands,
    };
  }

  factory LoginResponseData.fromMap(Map<String, dynamic> map) {
    return LoginResponseData(
      id: map['id'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      userName: map['userName'] ?? '',
      password: map['password'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      emailConfirmed: map['emailConfirmed'] ?? false,
      roles: map['roles'] != null ? List<String>.from(map['roles']) : [],
      token: (map['token']) ?? '',
      brands: map['brand'] != null ? List<Brands>.from(map['brand']) : [],
      dateAdded: map['dateAdded'] ?? '',
      fullName: map['fullName'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      socialLoginId: map['socialLoginId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseData.fromJson(String source) =>
      LoginResponseData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ResultData(id: $id,firstName: $firstName,lastName: $lastName ,email: $email,userName: $userName,password: $password,phoneNumber: $phoneNumber,emailConfirmed: $emailConfirmed,roles: $roles,token: $token,imageUrl: $imageUrl,socialLoginId: $socialLoginId,dateAdded: $dateAdded,fullName: $fullName,brands: $brands,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginResponseData &&
        other.emailConfirmed == emailConfirmed &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.userName == userName &&
        other.email == email &&
        other.id == id &&
        other.phoneNumber == phoneNumber &&
        listEquals(other.roles, roles) &&
        listEquals(other.brands, brands) &&
        other.password == password &&
        other.fullName == fullName &&
        other.dateAdded == dateAdded &&
        other.token == token &&
        other.imageUrl == imageUrl &&
        other.socialLoginId == socialLoginId;
  }

  @override
  int get hashCode {
    return emailConfirmed.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        userName.hashCode ^
        id.hashCode ^
        phoneNumber.hashCode ^
        email.hashCode ^
        roles.hashCode ^
        token.hashCode ^
        password.hashCode ^
        brands.hashCode ^
        fullName.hashCode ^
        dateAdded.hashCode ^
        socialLoginId.hashCode ^
        imageUrl.hashCode;
  }
}

class Brands {
  final String imageUrl;
  final String name;
  final String nameAr;
  final int id;

  Brands({
    required this.imageUrl,
    required this.name,
    required this.nameAr,
    required this.id,
  });

  Brands copyWith({
    String? imageUrl,
    String? name,
    String? nameAr,
    int? id,
  }) {
    return Brands(
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      nameAr: nameAr ?? this.nameAr,
      id: id ?? this.id,
    );
  }

  factory Brands.fromMap(Map<String, dynamic> map) {
    return Brands(imageUrl: map['imageUrl'] ?? '',
      name: map['name'] ?? '',
      nameAr: map['nameAr'] ?? '',
      id: map['id'] ?? '',);
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'nameAr': nameAr,
      'id': id,
    };
  }

  String toJson() => json.encode(toMap());

  factory Brands.fromJson(String source) =>
      Brands.fromMap(json.decode(source));
}

