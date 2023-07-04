import 'package:marvel_test/models/event/event.dart';

class EventStateResponse {
  final List<Event> events;
  final bool fullyLoaded;

  EventStateResponse({
    required this.events,
    required this.fullyLoaded,
  });
}
