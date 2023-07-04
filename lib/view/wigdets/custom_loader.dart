import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/res/colors/colors.dart';

enum SpinnerSize { small, normal }

class CustomLoader extends StatelessWidget {
  final SpinnerSize size;
  final Color? color;

  const CustomLoader({
    super.key,
    required this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    const Key key = Key('customLoader');
    final Color color = this.color ?? marvelWhite;
    late double size;

    switch (this.size) {
      case SpinnerSize.small:
        size = 30.w;
        break;
      case SpinnerSize.normal:
        size = 50.w;
        break;
      default:
        size = 30.w;
    }

    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator.adaptive(
          key: key,
          backgroundColor: Platform.isIOS ? color : null,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
    );
  }
}
