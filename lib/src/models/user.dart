import 'package:flutter/material.dart';

class User {
  final String id;
  final String fullName;
  final String email;
  final String photoUrl;
  final String birthday;
  final String aboutMe;
  final DateTime createdAt;
  final DateTime updatedAt;

  User(
      {this.id,
      @required this.fullName,
      @required this.email,
      @required this.photoUrl,
      this.birthday,
      this.aboutMe,
      this.createdAt,
      this.updatedAt});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        photoUrl = data['photoUrl'],
        birthday = data['birthday'],
        aboutMe = data['aboutMe'],
        createdAt = data['createdAt'],
        updatedAt = data['updatedAt'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'photoUrl': photoUrl,
      'birthday': birthday,
      'aboutMe': aboutMe,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}
