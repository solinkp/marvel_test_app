import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:marvel_test/utils/routes/router.gr.dart';
import 'package:marvel_test/models/character/character.dart';
import 'package:marvel_test/view/wigdets/image_container.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      onTap: () => _displayMoreInfo(context),
      imageUrl: character.thumbnail?.getImageUrl,
      title: character.name,
    );
  }

  void _displayMoreInfo(BuildContext context) {
    context.router.push(CharacterDetailsRoute(character: character));
  }
}
