import 'package:flutter/foundation.dart';

class Comment {
  final String documentId;
  final String postId;
  final String message;
  final String creator;
  final DateTime createdAt;
  final DateTime updatedAt;

  Comment(
      {this.documentId,
      @required this.postId,
      @required this.message,
      this.creator,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toMap() {
    var createDoc = <String, Object>{};
    if (postId != null) createDoc['postId'] = postId;
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
        postId: map['postId'],
        message: map['message'],
        creator: map['creator'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt']);
  }
}
