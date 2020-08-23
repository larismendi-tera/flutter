import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Comment {
  final String documentId;
  final String eventId;
  final String message;
  final String creator;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  Comment(
      {this.documentId,
      @required this.eventId,
      @required this.message,
      this.creator,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toMap() {
    var createDoc = <String, Object>{};
    if (eventId != null) createDoc['eventId'] = eventId;
    if (message != null) createDoc['message'] = message;
    if (creator != null) createDoc['creator'] = creator;
    if (createdAt != null) createDoc['createdAt'] = createdAt;
    if (updatedAt != null) createDoc['updatedAt'] = updatedAt;

    return createDoc;
  }

  static Comment fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Comment(
        documentId: map['documentId'],
        eventId: map['eventId'],
        message: map['message'],
        creator: map['creator'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt']);
  }
}
