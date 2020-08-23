import 'dart:io';

import 'package:myapp/src/blocs/base_bloc.dart';
import 'package:myapp/src/models/event.dart';
import 'package:myapp/src/resources/firestore_provider.dart';
import 'package:myapp/src/ui/helpers/UiAction.dart';
import 'package:rxdart/rxdart.dart';

enum ACTIONS {
  showToast,
  error,
}

class EventBloc extends BaseBloc {
  var _provider = FireStoreProvider();
  final _uiActions = BehaviorSubject<UiAction>();
  List<Event> _events;
  List<Event> get events => _events;

  Observable<UiAction> get actions => _uiActions.stream;

  Future<void> createEventBloc(Event event, File image) async {
    _provider.createEvent(event, image);
  }

  getEventsList() async {
    setLoading(true);
    var event = await _provider.getEventsOnceOff();
    _events = events;
    return event;
  }

  listenToEventsRealTime() async {
    setLoading(true);
    var events = await _provider.listenToEventsRealTime();
    /*.then((events) {
      setLoading(false);
      _events = events;
    }).catchError((err) {
      setLoading(false);
      _uiActions.sink.add(new UiAction(
          action: ACTIONS.showToast.index, message: err.toString()));
    });*/
    _events = events;
    return events;
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
