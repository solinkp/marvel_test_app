import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/generated/l10n.dart';
import 'package:marvel_test/models/story/story.dart';
import 'package:marvel_test/view/wigdets/image_container.dart';
import 'package:marvel_test/view/character_details/widgets/sheet_content_text.dart';
import 'package:marvel_test/view/character_details/widgets/segment_detail_sheet.dart';

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
    showBottomSheet(
      context: context,
      builder: (context) {
        return SegmentDetailSheet(
          title: story.title,
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SheetContentText(
                    title: S.current.storyType,
                    text: story.type,
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Text(story.getDescription),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
