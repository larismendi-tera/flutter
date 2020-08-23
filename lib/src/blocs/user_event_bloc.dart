import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:myapp/src/models/event.dart';
import 'package:myapp/src/resources/firestore_provider.dart';
import 'package:myapp/src/resources/fireauth_provider.dart';
import 'package:myapp/src/models/user.dart';

class UserEventBloc implements Bloc {
  var _provider = FireStoreProvider();
  final fireAuthProvider = FireAuthProvider();
  List<Event> _events;
  List<Event> get events => _events;
  //Flujo de datos -streams
  //Stream - firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase =
      FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  void getEventsList() async {
    var users = await _provider.getUserList();
    print(users);
    /*setLoading(true);
    _provider.getEventsOnceOff().then((events) {
      setLoading(false);
      _events = events;
    }).catchError((err) {
      setLoading(false);
      _uiActions.sink.add(new UiAction(
          action: ACTIONS.showToast.index, message: err.toString()));
    });*/
  }

  @override
  void dispose() {}
}
