import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:marvel_test/res/constants/url.dart';
import 'package:marvel_test/models/event/event.dart';
import 'package:marvel_test/data/event/i_event_data_source.dart';

@LazySingleton(as: IEventDataSource)
class EventDataSource implements IEventDataSource {
  final Dio client;

  EventDataSource({required this.client});

  @override
  Future<List<Event>> getCharEvents(int charId, int offset) async {
    final response = await client.get(
      '$baseUrl/$charId/$eventsUrlSuff',
      queryParameters: {'offset': offset},
    );

    List<Event> events = [];
    for (var event in response.data['data']['results']) {
      events.add(Event.fromJson(event));
    }
    return events;
  }
}
