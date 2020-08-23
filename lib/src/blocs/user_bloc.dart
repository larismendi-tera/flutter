import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:myapp/src/resources/firestore_provider.dart';
import 'package:myapp/src/resources/fireauth_provider.dart';
import 'package:myapp/src/models/user.dart';

class UserBloc implements Bloc {
  var _provider = FireStoreProvider();
  final fireAuthProvider = FireAuthProvider();
  List<User> _users;
  List<User> get users => _users;
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

  void getUsersList() async {
    _provider.getUserList().then((events) {
      _users = users;
    }).catchError((err) {
      print(err.toString());
    });
  }

  @override
  void dispose() {}
}
