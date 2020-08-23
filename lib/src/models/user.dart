import 'package:flutter/material.dart';

class User {
  final String id;
  final String fullName;
  final String email;
  final String avatar;
  final String birthday;
  final String aboutMe;
  final DateTime createdAt;
  final DateTime updatedAt;

  User(
      {this.id,
      @required this.fullName,
      @required this.email,
      @required this.avatar,
      this.birthday,
      this.aboutMe,
      this.createdAt,
      this.updatedAt});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        avatar = data['avatar'],
        birthday = data['birthday'],
        aboutMe = data['aboutMe'],
        createdAt = data['createdAt'],
        updatedAt = data['updatedAt'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'avatar': avatar,
      'birthday': birthday,
      'aboutMe': aboutMe,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  static User fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return User(
        id: map['id'],
        fullName: map['fullName'],
        email: map['email'],
        avatar: map['avatar'],
        birthday: map['birthday'],
        aboutMe: map['aboutMe'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt']);
  }
}
