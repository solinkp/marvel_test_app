import 'package:marvel_test/models/serie/serie.dart';

abstract class ISerieDataSource {
  Future<List<Serie>> getCharSeries(int charId);
}
