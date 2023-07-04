import 'package:injectable/injectable.dart';

import 'package:marvel_test/models/serie/serie.dart';
import 'package:marvel_test/data/serie/i_serie_data_source.dart';
import 'package:marvel_test/repository/serie/i_serie_repository.dart';

@LazySingleton(as: ISerieRepository)
class SerieRepository implements ISerieRepository {
  final ISerieDataSource _serieDataSource;

  SerieRepository(this._serieDataSource);

  @override
  Future<List<Serie>> getCharSeries({
    required int charId,
    required int offset,
  }) async {
    try {
      return await _serieDataSource.getCharSeries(charId, offset);
    } catch (e) {
      return [];
    }
  }
}
