import 'package:marvel_test/models/event/event.dart';

abstract class IEventRepository {
  Future<List<Event>> getCharEvents({required int charId});
}
