import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/generated/l10n.dart';
import 'package:marvel_test/models/serie/serie.dart';
import 'package:marvel_test/view/wigdets/image_container.dart';
import 'package:marvel_test/view/character_details/widgets/sheet_content_text.dart';
import 'package:marvel_test/view/character_details/widgets/segment_detail_sheet.dart';

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
    showBottomSheet(
      context: context,
      builder: (context) {
        return SegmentDetailSheet(
          title: serie.title,
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SheetContentText(
                    title: S.current.serieEmission,
                    text: serie.getEmissionTime,
                  ),
                  SheetContentText(
                    title: S.current.serieRating,
                    text: serie.getRating,
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Text(serie.getDescription),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
