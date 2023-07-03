import 'package:json_annotation/json_annotation.dart';

part 'art.g.dart';

@JsonSerializable()
class Art {
  final String path;
  final String extension;

  Art({
    required this.path,
    required this.extension,
  });

  factory Art.fromJson(Map<String, dynamic> json) =>
      _$ArtFromJson(json);
}
