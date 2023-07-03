import 'package:json_annotation/json_annotation.dart';

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
}
