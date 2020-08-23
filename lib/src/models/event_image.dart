import 'package:flutter/foundation.dart';

class EventImage {
  final String documentId;
  final String eventId;
  final String photoUrl;
  final String creator;
  final DateTime createdAt;
  final DateTime updatedAt;

  EventImage(
      {this.documentId,
      @required this.eventId,
      @required this.photoUrl,
      this.creator,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toMap() {
    var createDoc = <String, Object>{};
    if (eventId != null) createDoc['eventId'] = eventId;
    if (photoUrl != null) createDoc['photoUrl'] = photoUrl;
    if (creator != null) createDoc['creator'] = creator;
    if (createdAt != null) createDoc['createdAt'] = createdAt;
    if (updatedAt != null) createDoc['updatedAt'] = updatedAt;

    return createDoc;
  }

  static EventImage fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return EventImage(
        documentId: map['documentId'],
        eventId: map['eventId'],
        photoUrl: map['photoUrl'],
        creator: map['creator'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt']);
  }
}
