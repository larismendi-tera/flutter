import 'package:myapp/src/blocs/base_bloc.dart';
import 'package:myapp/src/models/event.dart';
import 'package:myapp/src/services/repository_service.dart';
import 'package:myapp/src/ui/helpers/UiAction.dart';
import 'package:rxdart/rxdart.dart';

enum ACTIONS {
  showToast,
  error,
}

class EventsBloc extends BaseBloc {
  var _repository;
  final _uiActions = BehaviorSubject<UiAction>();
  List<Event> _events;
  List<Event> get events => _events;

  EventsBloc([RepositoryService repoService]) {
    _repository = repoService;
  }

  Observable<UiAction> get actions => _uiActions.stream;

  void getEventsList() async {
    setLoading(true);
    _repository.getEventsOnceOff().then((events) {
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
    _repository.listenToEventsRealTime().then((events) {
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
    _repository.deleteEvent(documentId).then((event) {
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
    _repository.updateEvent(event).then((event) {
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
