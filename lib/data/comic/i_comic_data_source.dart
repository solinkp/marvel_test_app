import 'package:marvel_test/models/comic/comic.dart';

abstract class IComicDataSource {
  Future<List<Comic>> getCharComics(int charId);
}
