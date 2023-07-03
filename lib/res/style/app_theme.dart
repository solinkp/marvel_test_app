import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/res/colors/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: marvelBlueGrey,
    colorScheme: const ColorScheme.light(
      primary: marvelBlueGrey,
      onPrimary: marvelWhite,
      secondary: marvelGrey,
      onSecondary: marvelWhite,
    ),
    scaffoldBackgroundColor: marvelBlueGrey,
    splashColor: marvelBrown,
    brightness: Brightness.light,
    dialogBackgroundColor: marvelBlueGrey,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      titleTextStyle: TextStyle(
        fontSize: 22.sp,
        color: marvelDarkGrey,
        decoration: TextDecoration.underline,
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 25.sp,
        color: marvelBlueGrey,
        fontFamily: 'Courgette',
      ),
      headlineMedium: TextStyle(
        fontSize: 26.sp,
        color: marvelDarkGrey,
        fontFamily: 'Courgette',
        decoration: TextDecoration.underline,
      ),
      headlineLarge: TextStyle(
        fontSize: 28.sp,
        color: marvelDarkGrey,
        fontFamily: 'Courgette',
        decoration: TextDecoration.underline,
      ),
      titleSmall: TextStyle(
        fontSize: 20.sp,
        color: marvelDarkGrey,
      ),
      titleMedium: TextStyle(
        fontSize: 22.sp,
        color: marvelDarkGrey,
        decoration: TextDecoration.underline,
      ),
      titleLarge: TextStyle(
        fontSize: 24.sp,
        color: marvelDarkGrey,
        decoration: TextDecoration.underline,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.sp,
        color: marvelDarkGrey,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        color: marvelDarkGrey,
      ),
      bodySmall: TextStyle(
        fontSize: 15.sp,
        color: marvelDarkGrey,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: marvelBrown,
        foregroundColor: marvelWhite,
        textStyle: TextStyle(fontSize: 16.sp),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: marvelBrown,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: marvelBrown,
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: marvelBrown,
        statusBarIconBrightness: Brightness.light,
      ),
      centerTitle: false,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
