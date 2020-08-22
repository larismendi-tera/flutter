import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String name;
  final String description;
  final String date;
  final String location;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DocumentReference reference;

  Event.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Event.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['description'] != null),
        assert(map['date'] != null),
        assert(map['location'] != null),
        assert(map['createdAt'] != null),
        assert(map['updatedAt'] != null),
        name = map['name'],
        description = map['description'],
        date = map['date'],
        location = map['location'],
        createdAt = map['createdAt'],
        updatedAt = map['updatedAt'];

  @override
  String toString() => "Record<$name:$description>";
}
