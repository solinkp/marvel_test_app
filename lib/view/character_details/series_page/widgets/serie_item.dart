import 'package:flutter/material.dart';

import 'package:marvel_test/models/serie/serie.dart';
import 'package:marvel_test/view/wigdets/image_container.dart';

class SerieItem extends StatelessWidget {
  final Serie serie;

  const SerieItem({super.key, required this.serie});

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      onTap: () => _displayMoreInfo(context),
      title: serie.title,
      imageUrl: serie.thumbnail?.getImageUrl,
    );
  }

  void _displayMoreInfo(BuildContext context) {
    // show bootom sheet
  }
}
