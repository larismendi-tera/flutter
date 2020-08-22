import 'package:flutter/foundation.dart';

class Event {
  final String documentId;
  final String title;
  final String description;
  final String date;
  final String location;
  final String inventory;
  final DateTime createdAt;
  final DateTime updatedAt;

  Event(
      {this.documentId,
      @required this.title,
      @required this.description,
      @required this.date,
      @required this.location,
      this.inventory,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'documentId': documentId,
      'name': title,
      'description': description,
      'date': date,
      'location': location,
      'inventory': inventory,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  static Event fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Event(
        documentId: map['documentId'],
        title: map['title'],
        description: map['description'],
        date: map['date'],
        location: map['location'],
        inventory: map['inventory'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt']);
  }
}
