import 'package:marvel_test/models/story/story.dart';

class StoryStateResponse {
  final List<Story> stories;
  final bool fullyLoaded;

  StoryStateResponse({
    required this.stories,
    required this.fullyLoaded,
  });
}
