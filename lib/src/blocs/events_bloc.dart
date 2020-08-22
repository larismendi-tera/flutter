import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/event.dart';

class EventsBloc {
  final _repository = Repository();
  final _eventsFetcher = PublishSubject<Event>();

  Observable<Event> get allEvents => _eventsFetcher.stream;

  fetchAllEvents() async {
    Event itemModel = await _repository.fetchAllEvents();
    _eventsFetcher.sink.add(itemModel);
  }

  dispose() {
    _eventsFetcher.close();
  }
}

final bloc = EventsBloc();
