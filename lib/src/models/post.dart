import 'package:flutter/foundation.dart';

class Post {
  final String documentId;
  final String postType;
  final String body;
  final String creator;
  final DateTime createdAt;
  final DateTime updatedAt;

  Post(
      {this.documentId,
      @required this.postType,
      @required this.body,
      this.creator,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toMap() {
    var createDoc = <String, Object>{};
    if (postType != null) createDoc['postType'] = postType;
    if (body != null) createDoc['body'] = body;
    if (creator != null) createDoc['creator'] = creator;
    if (createdAt != null) createDoc['createdAt'] = createdAt;
    if (updatedAt != null) createDoc['updatedAt'] = updatedAt;

    return createDoc;
  }

  static Post fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Post(
        documentId: map['documentId'],
        postType: map['postType'],
        body: map['body'],
        creator: map['creator'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt']);
  }
}
