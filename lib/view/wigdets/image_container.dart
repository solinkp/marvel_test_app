import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/res/colors/colors.dart';
import 'package:marvel_test/view/wigdets/single_image.dart';
import 'package:marvel_test/view/wigdets/swiper_images.dart';

class ImageContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool hasSwiper;
  final String? imageUrl;
  final List<String>? imagesUrls;

  const ImageContainer({
    super.key,
    required this.onTap,
    required this.title,
    this.hasSwiper = false,
    this.imageUrl,
    this.imagesUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.sp),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        highlightColor: Colors.transparent,
        splashColor: marvelBrown,
        onTap: () => onTap,
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
                  child: hasSwiper
                      ? SwiperImages(imagesUrls: imagesUrls!)
                      : SingleImage(imageUrl: imageUrl!),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Tooltip(
                message: title,
                triggerMode: TooltipTriggerMode.tap,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: marvelRed,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: marvelBrown,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: marvelWhite,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
