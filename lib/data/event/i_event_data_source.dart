import 'package:marvel_test/models/event/event.dart';

abstract class IEventDataSource {
  Future<List<Event>> getCharEvents(int charId);
}
