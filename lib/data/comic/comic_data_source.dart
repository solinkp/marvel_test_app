import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:marvel_test/res/constants/url.dart';
import 'package:marvel_test/models/comic/comic.dart';
import 'package:marvel_test/data/comic/i_comic_data_source.dart';

@LazySingleton(as: IComicDataSource)
class ComicDataSource implements IComicDataSource {
  final Dio client;

  ComicDataSource({required this.client});

  @override
  Future<List<Comic>> getCharComics(int charId, int offset) async {
    final response = await client.get(
      '$baseUrl/$charId/$comicsUrlSuff',
      queryParameters: {'offset': offset},
    );

    List<Comic> comics = [];
    for (var comic in response.data['data']['results']) {
      comics.add(Comic.fromJson(comic));
    }
    return comics;
  }
}
