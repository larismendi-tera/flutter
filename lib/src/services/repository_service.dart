// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:myapp/src/models/event.dart';
import 'package:myapp/src/models/user.dart';

abstract class RepositoryService {
  Future<FirebaseUser> signInWithCredential(AuthCredential credential);

  Future<FirebaseUser> singInFirebase();

  Future<void> signOut();

  Future<void> registerUser(User user);

  Future<User> getUser(String userId);

  Future<User> updateUser(User user);

  Future<void> createEvent(Event event);

  Future<void> getEventsOnceOff();

  Stream<void> listenToEventsRealTime();

  Future<void> deleteEvent(String documentId);

  Future<void> updateEvent(Event event);

  // Future<StorageTaskSnapshot> uploadUserAvatar(String userId, File image);

  // Stream<QuerySnapshot> getChatList();

  // Stream<QuerySnapshot> getChatHistory(ChatInfo chatInfo);

  // Future<void> sendChatMsg(ChatInfo chatInfo, String content, int type);
}
