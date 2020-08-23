import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Like {
  final String documentId;
  final String commentId;
  final String userId;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  Like(
      {this.documentId,
      @required this.commentId,
      @required this.userId,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toMap() {
    var createDoc = <String, Object>{};
    if (commentId != null) createDoc['commentId'] = commentId;
    if (userId != null) createDoc['userId'] = userId;
    if (createdAt != null) createDoc['createdAt'] = createdAt;
    if (updatedAt != null) createDoc['updatedAt'] = updatedAt;

    return createDoc;
  }

  static Like fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Like(
        documentId: map['documentId'],
        commentId: map['commentId'],
        userId: map['userId'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt']);
  }
}
