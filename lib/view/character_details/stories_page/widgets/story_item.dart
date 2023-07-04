import 'package:flutter/material.dart';

import 'package:marvel_test/models/story/story.dart';
import 'package:marvel_test/view/wigdets/image_container.dart';

class StoryItem extends StatelessWidget {
  final Story story;

  const StoryItem({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      onTap: () => _displayMoreInfo(context),
      title: story.title,
      imageUrl: story.thumbnail?.getImageUrl,
    );
  }

  void _displayMoreInfo(BuildContext context) {
    // show bootom sheet
  }
}
