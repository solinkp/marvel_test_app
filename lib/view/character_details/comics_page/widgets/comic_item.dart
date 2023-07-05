import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/generated/l10n.dart';
import 'package:marvel_test/models/comic/comic.dart';
import 'package:marvel_test/view/wigdets/image_container.dart';
import 'package:marvel_test/view/character_details/widgets/sheet_content_text.dart';
import 'package:marvel_test/view/character_details/widgets/segment_detail_sheet.dart';

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
    showBottomSheet(
      context: context,
      builder: (context) {
        return SegmentDetailSheet(
          title: comic.title,
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SheetContentText(
                    title: S.current.comicIssueNumber,
                    text: '${comic.issueNumber}',
                  ),
                  SheetContentText(
                    title: S.current.comicPageCount,
                    text: '${comic.pageCount}',
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Text(comic.getDescription),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
