import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:marvel_test/res/constants/url.dart';
import 'package:marvel_test/models/story/story.dart';
import 'package:marvel_test/data/story/i_story_data_source.dart';

@LazySingleton(as: IStoryDataSource)
class ComicDataSource implements IStoryDataSource {
  final Dio client;

  ComicDataSource({required this.client});

  @override
  Future<List<Story>> getCharStories(int charId, int offset) async {
    final response = await client.get(
      '$baseUrl/$charId/$storiesUrlSuff',
      queryParameters: {'offset': offset},
    );

    List<Story> stories = [];
    for (var story in response.data['data']['results']) {
      stories.add(Story.fromJson(story));
    }
    return stories;
  }
}
