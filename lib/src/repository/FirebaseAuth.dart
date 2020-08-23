import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/src/models/user.dart';
import 'package:myapp/src/resources/firestore_provider.dart';

class FirebaseAuthApi {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  var _provider = FireStoreProvider();

  Future<FirebaseUser> signIn() async {
    FirebaseUser firebaseUser;
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    print(gSA);
    final AuthCredential authCredential = GoogleAuthProvider.getCredential(
        accessToken: gSA.accessToken, idToken: gSA.idToken);

    firebaseUser = await _auth.signInWithCredential(authCredential);

    if (firebaseUser != null) {
      // Check is already sign up
      var user = await _provider.getUser(firebaseUser.uid);

      if (user == null) {
        // Update data to server if new user
        user = User(
            id: firebaseUser.uid,
            fullName: firebaseUser.displayName,
            email: firebaseUser.email,
            avatar: firebaseUser.photoUrl);

        await _provider.registerUser(user);
      }
      // Write data to local
      // setCurrentUser(firebaseUser);
      // saveUserLocally(firebaseUser);
    }

    return firebaseUser;
  }

  void signOut() async {
    await _auth.signOut().then((onValue) => print("sesion cerrada"));
    await googleSignIn.signOut();
  }
}
