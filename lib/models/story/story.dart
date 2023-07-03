import 'package:json_annotation/json_annotation.dart';

import 'package:marvel_test/models/art/art.dart';

part 'story.g.dart';

@JsonSerializable()
class Story {
  final int id;
  final String title;
  final String type;
  final String? description;
  final Art? thumbnail;

  Story({
    required this.id,
    required this.title,
    required this.type,
    this.description,
    this.thumbnail,
  });

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
