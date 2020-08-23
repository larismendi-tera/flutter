import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:myapp/src/resources/fireauth_provider.dart';

class UserBloc implements Bloc {
  final fireAuthProvider = FireAuthProvider();
  //Flujo de datos -streams
  //Stream - firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase =
      FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  //casos de uso
  //1. singnIn Googlw
  Future<FirebaseUser> singInFirebase() {
    return fireAuthProvider.singInFirebase();
  }

  Future<void> signOutBloc() async {
    fireAuthProvider.signOut();
  }

  @override
  void dispose() {}
}
