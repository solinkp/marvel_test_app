import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/res/colors/colors.dart';
import 'package:marvel_test/view/wigdets/single_image.dart';

class ImagePortrait extends StatelessWidget {
  final String imageUrl;

  const ImagePortrait({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        highlightColor: Colors.transparent,
        splashColor: marvelBrown,
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(5.sp),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: marvelRed,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: marvelRed,
                    width: 3,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: SingleImage(imageUrl: imageUrl),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
