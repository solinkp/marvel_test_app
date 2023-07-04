import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/view/wigdets/custom_loader.dart';

class CustomGridview extends StatelessWidget {
  final ScrollController controller;
  final int itemCount;
  final int itemLength;
  final Widget Function(int) builder;
  final int padding;
  final int axisCount;

  const CustomGridview({
    super.key,
    required this.controller,
    required this.itemCount,
    required this.itemLength,
    required this.builder,
    this.padding = 5,
    this.axisCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: padding.w),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: axisCount,
      ),
      itemBuilder: (_, index) {
        if (index < itemLength) {
          return builder(index);
        } else {
          return const CustomLoader(size: SpinnerSize.small);
        }
      },
    );
  }
}
