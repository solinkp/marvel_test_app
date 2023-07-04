import 'package:marvel_test/models/comic/comic.dart';

class ComicStateResponse {
  final List<Comic> comics;
  final bool fullyLoaded;

  ComicStateResponse({
    required this.comics,
    required this.fullyLoaded,
  });
}
