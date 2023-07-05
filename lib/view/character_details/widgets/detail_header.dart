import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/models/character/character.dart';
import 'package:marvel_test/view/wigdets/image_portrait.dart';

class DetailHeader extends StatelessWidget {
  final Character character;

  const DetailHeader({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ImagePortrait(
            imageUrl: character.thumbnail?.getImageUrl ?? '',
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 5.h, bottom: 10.h, right: 10.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Text(character.getDescription),
            ),
          ),
        ),
      ],
    );
  }
}
