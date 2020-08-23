// import 'dart:developer';
import 'dart:async';
// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:myapp/src/models/event.dart';
import 'package:myapp/src/models/user.dart';
import 'package:myapp/src/resources/fireauth_provider.dart';
// import 'package:myapp/src/resources/firestorage_provider.dart';
import 'package:myapp/src/resources/firestore_provider.dart';
import 'package:myapp/src/services/repository_service.dart';

class RepositoryImplementationService implements RepositoryService {
  final _fireAuthProvider = FireAuthProvider();
  final _fireStoreProvider = FireStoreProvider();
  // final _fireStorageProvider = FireStorageProvider();

  Future<FirebaseUser> signInWithCredential(AuthCredential credential) =>
      _fireAuthProvider.signInWithCredential(credential);

  Future<FirebaseUser> singInFirebase() => _fireAuthProvider.singInFirebase();

  void signOut() => _fireAuthProvider.signOut();

  Future<void> registerUser(User user) => _fireStoreProvider.registerUser(user);

  Future<User> getUser(String userId) {
    return _fireStoreProvider.getUser(userId);
  }

  Future<User> updateUser(User user) {
    return _fireStoreProvider.updateUser(user);
  }

  // Future<Event> createEventRepository(Event event) {
  //   return _fireStoreProvider.createEvent(event);
  // }

  Future<void> getEventsUpcoming() => _fireStoreProvider.getEventsUpcoming();

  Future listenToEventsRealTime() =>
      _fireStoreProvider.listenToEventsRealTime();

  Future<void> updateEvent(Event event) =>
      _fireStoreProvider.updateEvent(event);

  Future<void> deleteEvent(String documentId) =>
      _fireStoreProvider.deleteEvent(documentId);

  // Future<StorageTaskSnapshot> uploadUserAvatar(String userId, File image) {
  //   return _fireStorageProvider.uploadUserAvatar(userId, image);
  // }

  // Stream<QuerySnapshot> getChatList() => _fireStoreProvider.getChatList();

  // Stream<QuerySnapshot> getChatHistory(ChatInfo chatInfo) =>
  //     _fireStoreProvider.getChatHistory(chatInfo);

  // Future<void> sendChatMsg(ChatInfo chatInfo, String content, int type) {
  //   var lastContent = content;
  //   if (type == 1) {
  //     lastContent = "Image was sent";
  //   } else if (type == 2) {
  //     lastContent = "Sticker was sent";
  //   }

  //   return _fireStoreProvider.sendChatMsg(chatInfo, content, type).then((_) {
  //     _fireStoreProvider.setChatLastMsg(chatInfo, lastContent);
  //   });
  // }
}
