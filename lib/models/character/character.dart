import 'package:json_annotation/json_annotation.dart';

import 'package:marvel_test/models/art/art.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  final int id;
  final String name;
  final String? description;
  final Art? thumbnail;

  Character({
    required this.id,
    required this.name,
    this.description,
    this.thumbnail,
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  String get getImageUrl {
    return '${thumbnail?.path}.${thumbnail?.extension}';
  }
}
