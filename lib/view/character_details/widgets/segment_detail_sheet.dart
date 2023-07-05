import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SegmentDetailSheet extends StatelessWidget {
  final String title;
  final Widget content;

  const SegmentDetailSheet({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      onClosing: () {},
      builder: (BuildContext context) {
        var size = MediaQuery.of(context).size;

        return SizedBox(
          height: size.height * 0.45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Tooltip(
                  message: title,
                  triggerMode: TooltipTriggerMode.tap,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: content,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
