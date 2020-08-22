import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthApi {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    print(googleSignInAccount);
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    final AuthCredential authCredential = GoogleAuthProvider.getCredential(
        accessToken: gSA.accessToken, idToken: gSA.idToken);

    final FirebaseUser user = await _auth.signInWithCredential(authCredential);

    return user;
  }

  void signOut() async {
    await _auth.signOut().then((onValue) => print("sesion cerrada"));
    googleSignIn.signOut();
  }
}
