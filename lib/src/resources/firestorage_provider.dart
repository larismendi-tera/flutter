import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireStorageProvider {
  FirebaseStorage _fireStorage = FirebaseStorage.instance;

  Future<StorageTaskSnapshot> uploadUserAvatar(String userId, File image) {
    StorageReference reference = _fireStorage.ref().child(userId);
    StorageUploadTask uploadTask = reference.putFile(image);
    return uploadTask.onComplete;
  }

  Future<StorageTaskSnapshot> uploadImageEvent(
      String imageEventId, File image) {
    StorageReference reference = _fireStorage.ref().child(imageEventId);
    StorageUploadTask uploadTask = reference.putFile(image);
    return uploadTask.onComplete;
  }
}
