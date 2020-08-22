import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/src/repository/FirebaseAuth.dart';

class FireAuthProvider {
  FirebaseAuth _fireAuth = FirebaseAuth.instance;
  final _firebaseAuthApi = FirebaseAuthApi();

  Future<FirebaseUser> signInWithCredential(AuthCredential credential) async {
    return _fireAuth.signInWithCredential(credential);
  }

  Future<FirebaseUser> singInFirebase() => _firebaseAuthApi.signIn();

  signOut() => _firebaseAuthApi.signOut();
}
