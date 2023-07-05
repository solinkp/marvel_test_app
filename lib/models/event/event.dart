import 'package:json_annotation/json_annotation.dart';

import 'package:marvel_test/generated/l10n.dart';
import 'package:marvel_test/models/art/art.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  final int id;
  final String title;
  final String? description;
  final Art? thumbnail;

  Event({
    required this.id,
    required this.title,
    this.description,
    this.thumbnail,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  String get getDescription {
    return description == null || description!.isEmpty
        ? S.current.descripNotAvail
        : description!;
  }
}
