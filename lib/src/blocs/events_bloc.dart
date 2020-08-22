import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:rxdart/rxdart.dart';
import 'package:myapp/src/resources/repository.dart';
// import 'package:myapp/src/models/event.dart';

class EventsBloc {
  final _repository = Repository();

  Stream<QuerySnapshot> get stream => _repository.stream();
}

final bloc = EventsBloc();
