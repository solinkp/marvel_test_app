import 'package:marvel_test/models/serie/serie.dart';

abstract class ISerieRepository {
  Future<List<Serie>?> getCharSeries({
    required int charId,
    required int offset,
  });
}
