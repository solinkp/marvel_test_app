import 'package:json_annotation/json_annotation.dart';

import 'package:marvel_test/models/art/art.dart';

part 'comic.g.dart';

@JsonSerializable()
class Comic {
  final int id;
  final String title;
  final int issueNumber;
  final int pageCount;
  final String? description;
  final List<Art>? images;

  Comic({
    required this.id,
    required this.title,
    required this.issueNumber,
    required this.pageCount,
    this.description,
    this.images,
  });

  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);

  List<String> get getImages {
    List<String> urls = [];
    for (var image in images ?? <Art>[]) {
      urls.add('${image.path}.${image.extension}');
    }
    return urls;
  }
}
