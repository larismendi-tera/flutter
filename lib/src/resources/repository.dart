import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'event_provider.dart';

class Repository {
  final eventsApiProvider = EventProvider();

  Stream<QuerySnapshot> eventStream() => eventsApiProvider.stream();
}
