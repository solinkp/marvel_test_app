import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/models/event/event.dart';
import 'package:marvel_test/view/wigdets/image_container.dart';
import 'package:marvel_test/view/character_details/widgets/segment_detail_sheet.dart';

class EventItem extends StatelessWidget {
  final Event event;

  const EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      onTap: () => _displayMoreInfo(context),
      title: event.title,
      imageUrl: event.thumbnail?.getImageUrl,
    );
  }

  void _displayMoreInfo(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return SegmentDetailSheet(
          title: event.title,
          content: Column(
            children: [
              Text(event.getDescription),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
