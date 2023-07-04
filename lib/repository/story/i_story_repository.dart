import 'package:marvel_test/models/story/story.dart';

abstract class IStoryRepository {
  Future<List<Story>?> getCharStories({
    required int charId,
    required int offset,
  });
}
