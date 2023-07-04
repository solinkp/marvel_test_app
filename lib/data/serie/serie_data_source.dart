import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:marvel_test/res/constants/url.dart';
import 'package:marvel_test/models/serie/serie.dart';
import 'package:marvel_test/data/serie/i_serie_data_source.dart';

@LazySingleton(as: ISerieDataSource)
class SerieDataSource implements ISerieDataSource {
  final Dio client;

  SerieDataSource({required this.client});

  @override
  Future<List<Serie>> getCharSeries(int charId, int offset) async {
    final response = await client.get(
      '$baseUrl/$charId/$seriesUrlSuff',
      queryParameters: {'offset': offset},
    );

    List<Serie> series = [];
    for (var serie in response.data['data']['results']) {
      series.add(Serie.fromJson(serie));
    }
    return series;
  }
}
