import 'dart:developer';
import 'package:myapp/src/blocs/base_bloc.dart';
import 'package:myapp/src/models/event.dart';
import 'package:myapp/src/resources/firestore_provider.dart';
import 'package:myapp/src/ui/helpers/UiAction.dart';
import 'package:rxdart/rxdart.dart';

enum ACTIONS {
  showToast,
  error,
}

class EventsBloc extends BaseBloc {
  var _provider = FireStoreProvider();
  final _uiActions = BehaviorSubject<UiAction>();
  List<Event> _events;
  List<Event> get events => _events;

  Observable<UiAction> get actions => _uiActions.stream;

  Future<void> createEventBloc(Event event) async {
    _provider.createEvent(event);
  }

  void getEventsList() async {
    setLoading(true);
    _provider.getEventsOnceOff().then((events) {
      setLoading(false);
      _events = events;
    }).catchError((err) {
      setLoading(false);
      _uiActions.sink.add(new UiAction(
          action: ACTIONS.showToast.index, message: err.toString()));
    });
  }

  void listenToEventsRealTime() async {
    setLoading(true);
    _provider.listenToEventsRealTime().then((events) {
      setLoading(false);
      _events = events;
    }).catchError((err) {
      setLoading(false);
      _uiActions.sink.add(new UiAction(
          action: ACTIONS.showToast.index, message: err.toString()));
    });
  }

  void deleteEvent(String documentId) async {
    setLoading(true);
    _provider.deleteEvent(documentId).then((event) {
      setLoading(false);
      _uiActions.sink.add(new UiAction(
          action: ACTIONS.showToast.index, message: 'Delete success'));
    }).catchError((err) {
      setLoading(false);
      _uiActions.sink.add(new UiAction(
          action: ACTIONS.showToast.index, message: err.toString()));
    });
  }

  void updateEvent(Event event) async {
    setLoading(true);
    _provider.updateEvent(event).then((event) {
      setLoading(false);
      _uiActions.sink.add(new UiAction(
          action: ACTIONS.showToast.index, message: 'Update success'));
    }).catchError((err) {
      setLoading(false);
      _uiActions.sink.add(new UiAction(
          action: ACTIONS.showToast.index, message: err.toString()));
    });
  }

  void dispose() {
    super.dispose();
    _uiActions.drain();
    _uiActions.close();
  }
}
