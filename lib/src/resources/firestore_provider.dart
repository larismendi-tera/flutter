import 'dart:developer';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:myapp/src/models/event.dart';
import 'package:myapp/src/models/user.dart';

class FireStoreProvider {
  Firestore _firestore = Firestore.instance;

  Future<int> authenticateUser() async {
    final QuerySnapshot result =
        await _firestore.collection("users").getDocuments();
    final List<DocumentSnapshot> docs = result.documents;
    if (docs.length == 0) {
      return 0;
    } else {
      return 1;
    }
  }

  Future<void> registerUser(User user) async {
    _firestore.collection('users').document(user.id).setData({
      'id': user.id,
      'fullName': user.fullName,
      'email': user.email,
      'avatar': user.avatar
    });
  }

  Future<User> getUser(String userId) async {
    var result = await _firestore
        .collection('users')
        .where('id', isEqualTo: userId)
        .getDocuments();
    List<DocumentSnapshot> documents = result.documents;
    if (documents.length == 1) {
      return User(
          id: documents[0]['id'],
          fullName: documents[0]['fullName'],
          email: documents[0]['email'],
          avatar: documents[0]['avatar'],
          birthday: documents[0]['birthday'],
          aboutMe: documents[0]['aboutMe']);
    }
    return null;
  }

  Future<User> updateUser(User user) async {
    return _firestore.collection("users").document(user.id).updateData({
      'fullName': user.fullName,
      'avatar': user.avatar,
      'birthday': user.birthday,
      'aboutMe': user.aboutMe,
      'updatedAt': user.updatedAt
    }).then((_) {
      return getUser(user.id);
    });
  }

  Future<void> createEvent(Event event) async {
    try {
      var user = await FirebaseAuth.instance.currentUser();
      if (user != null) {
        _firestore.collection('events').add({
          'title': event.title,
          'description': event.description,
          'date': event.date,
          'location': event.location,
          'creator': user.toString()
        }).then((value) {
          print(value.documentID);
        });
      }
    } catch (e) {
      if (e is PlatformException) {
        log(e.message);
      }

      log(e.toString());
    }
  }

  final CollectionReference _eventsCollectionReference =
      Firestore.instance.collection('events');

  final StreamController<List<Event>> _eventsController =
      StreamController<List<Event>>.broadcast();

  Future getEventsOnceOff() async {
    try {
      var eventDocumentSnapshot =
          await _eventsCollectionReference.getDocuments();
      if (eventDocumentSnapshot.documents.isNotEmpty) {
        var events = eventDocumentSnapshot.documents
            .map(
                (snapshot) => Event.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.title != null)
            .toList();
        return events;
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future listenToEventsRealTime() async {
    // Register the handler for when the events data changes
    _eventsCollectionReference.snapshots().listen((eventsSnapshot) {
      if (eventsSnapshot.documents.isNotEmpty) {
        var events = eventsSnapshot.documents
            .map(
                (snapshot) => Event.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.title != null)
            .toList();

        // Add the events onto the controller
        _eventsController.add(events);
      }
    });

    return _eventsController.stream;
  }

  Future deleteEvent(String documentId) async {
    await _eventsCollectionReference.document(documentId).delete();
  }

  Future updateEvent(Event event) async {
    try {
      await _eventsCollectionReference
          .document(event.documentId)
          .updateData(event.toMap());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }
}
