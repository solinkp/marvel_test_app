import 'package:flutter/material.dart';

import 'package:marvel_test/models/comic/comic.dart';
import 'package:marvel_test/view/wigdets/image_container.dart';

class ComicItem extends StatelessWidget {
  final Comic comic;

  const ComicItem({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      onTap: () => _displayMoreInfo(context),
      title: comic.title,
      hasSwiper: true,
      imagesUrls: comic.getImages,
    );
  }

  void _displayMoreInfo(BuildContext context) {
    // show bootom sheet
  }
}
