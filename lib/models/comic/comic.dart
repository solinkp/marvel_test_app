import 'package:json_annotation/json_annotation.dart';

import 'package:marvel_test/generated/l10n.dart';
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
    for (var art in images ?? <Art>[]) {
      urls.add(art.getImageUrl);
    }
    return urls;
  }

  String get getDescription {
    return description == null || description!.isEmpty
        ? S.current.descripNotAvail
        : description!;
  }
}
