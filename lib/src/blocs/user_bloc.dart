import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:myapp/src/repository/auth_repository.dart';

class UserBloc implements Bloc {
  final authRepository = AuthRepository();
  //Flujo de datos -streams
  //Stream - firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase =
      FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  //casos de uso
  //1. singnIn Googlw
  Future<FirebaseUser> signIn() {
    return authRepository.singInFirebase();
  }

  signOut() {
    authRepository.signOut();
  }

  @override
  void dispose() {}
}
