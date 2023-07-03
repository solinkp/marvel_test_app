import 'package:injectable/injectable.dart';

import 'package:marvel_test/models/comic/comic.dart';
import 'package:marvel_test/repository/comic/i_comic_repository.dart';
import 'package:marvel_test/data/comic/i_comic_data_source.dart';

@LazySingleton(as: IComicRepository)
class ComicRepository implements IComicRepository {
  final IComicDataSource _comicDataSource;

  ComicRepository(this._comicDataSource);

  @override
  Future<List<Comic>> getCharComics({required int charId}) async {
    try {
      return await _comicDataSource.getCharComics(charId);
    } catch (e) {
      return [];
    }
  }
}
