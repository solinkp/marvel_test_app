import 'package:json_annotation/json_annotation.dart';

import 'package:marvel_test/generated/l10n.dart';
import 'package:marvel_test/models/art/art.dart';

part 'serie.g.dart';

@JsonSerializable()
class Serie {
  final int id;
  final String title;
  final int startYear;
  final String rating;
  final int? endYear;
  final String? description;
  final Art? thumbnail;

  Serie({
    required this.id,
    required this.title,
    required this.startYear,
    required this.rating,
    this.endYear,
    this.description,
    this.thumbnail,
  });

  factory Serie.fromJson(Map<String, dynamic> json) => _$SerieFromJson(json);

  String get getEmissionTime {
    var endDate = endYear ?? S.current.nA;
    return '$startYear - $endDate';
  }

  String get getRating {
    return rating.isEmpty ? S.current.nA : rating;
  }

  String get getDescription {
    return description == null || description!.isEmpty
        ? S.current.descripNotAvail
        : description!;
  }
}
