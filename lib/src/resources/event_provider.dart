import 'package:cloud_firestore/cloud_firestore.dart';

class EventProvider {
  Stream<QuerySnapshot> stream() {
    return Firestore.instance.collection('events').snapshots();
  }
}
