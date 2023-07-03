import 'package:marvel_test/models/story/story.dart';

abstract class IStoryDataSource {
  Future<List<Story>> getCharStories(int charId);
}
