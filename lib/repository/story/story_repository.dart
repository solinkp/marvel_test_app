import 'package:injectable/injectable.dart';

import 'package:marvel_test/models/story/story.dart';
import 'package:marvel_test/data/story/i_story_data_source.dart';
import 'package:marvel_test/repository/story/i_story_repository.dart';

@LazySingleton(as: IStoryRepository)
class StoryRepository implements IStoryRepository {
  final IStoryDataSource _storyDataSource;

  StoryRepository(this._storyDataSource);

  @override
  Future<List<Story>> getCharStories({required int charId}) async {
    try {
      return await _storyDataSource.getCharStories(charId);
    } catch (e) {
      return [];
    }
  }
}
