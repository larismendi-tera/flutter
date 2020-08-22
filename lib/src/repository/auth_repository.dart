import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/src/repository/FirebaseAuth.dart';

class AuthRepository {
  final _firebaseAuthApi = FirebaseAuthApi();
  Future<FirebaseUser> singInFirebase() => _firebaseAuthApi.signIn();
  signOut() => _firebaseAuthApi.signOut();
}