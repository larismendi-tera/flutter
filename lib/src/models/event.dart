import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Event {
  final String documentId;
  final String title;
  final String description;
  final String date;
  final String location;
  final String creator;
  final String organizer;
  final String inventory;
  final String eventImages;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  Event(
      {this.documentId,
      @required this.title,
      @required this.description,
      @required this.date,
      @required this.location,
      this.organizer,
      this.creator,
      this.inventory,
      this.eventImages,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toMap() {
    var createDoc = <String, Object>{};
    if (title != null) createDoc['title'] = title;
    if (description != null) createDoc['description'] = description;
    if (date != null) createDoc['date'] = date;
    if (location != null) createDoc['location'] = location;
    if (creator != null) createDoc['creator'] = creator;
    if (organizer != null) createDoc['organizer'] = organizer;
    if (inventory != null) createDoc['inventory'] = inventory;
    if (eventImages != null) createDoc['eventImages'] = eventImages;
    if (createdAt != null) createDoc['createdAt'] = createdAt;
    if (updatedAt != null) createDoc['updatedAt'] = updatedAt;

    return createDoc;
  }

  static Event fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Event(
        documentId: map['documentId'],
        title: map['title'],
        description: map['description'],
        date: map['date'],
        location: map['location'],
        creator: map['creator'],
        organizer: map['organizer'],
        inventory: map['inventory'],
        eventImages: map['eventImages'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt']);
  }
}
