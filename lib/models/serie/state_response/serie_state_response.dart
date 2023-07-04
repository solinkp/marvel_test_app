import 'package:marvel_test/models/serie/serie.dart';

class SerieStateResponse {
  final List<Serie> series;
  final bool fullyLoaded;

  SerieStateResponse({
    required this.series,
    required this.fullyLoaded,
  });
}
