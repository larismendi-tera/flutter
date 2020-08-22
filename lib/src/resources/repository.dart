import 'dart:async';
import 'event_provider.dart';
import '../models/event.dart';

class Repository {
  final eventsApiProvider = EventProvider();

  Future<Event> fetchAllEvents() => eventsApiProvider.fetchEventList();
}
