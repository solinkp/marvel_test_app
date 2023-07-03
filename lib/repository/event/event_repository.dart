import 'package:injectable/injectable.dart';

import 'package:marvel_test/models/event/event.dart';
import 'package:marvel_test/data/event/i_event_data_source.dart';
import 'package:marvel_test/repository/event/i_event_repository.dart';

@LazySingleton(as: IEventRepository)
class EventRepository implements IEventRepository {
  final IEventDataSource _eventDataSource;

  EventRepository(this._eventDataSource);

  @override
  Future<List<Event>> getCharEvents({required int charId}) async {
    try {
      return await _eventDataSource.getCharEvents(charId);
    } catch (e) {
      return [];
    }
  }
}
