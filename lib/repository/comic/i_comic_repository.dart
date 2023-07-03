import 'package:marvel_test/models/comic/comic.dart';

abstract class IComicRepository {
  Future<List<Comic>> getCharComics({required int charId});
}
