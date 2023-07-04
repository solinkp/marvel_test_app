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
        color: marvelWhite,
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 25.sp,
        color: marvelWhite,
      ),
      headlineMedium: TextStyle(
        fontSize: 26.sp,
        color: marvelWhite,
      ),
      headlineLarge: TextStyle(
        fontSize: 28.sp,
        color: marvelWhite,
      ),
      titleSmall: TextStyle(
        fontSize: 20.sp,
        color: marvelWhite,
      ),
      titleMedium: TextStyle(
        fontSize: 22.sp,
        color: marvelWhite,
      ),
      titleLarge: TextStyle(
        fontSize: 24.sp,
        color: marvelWhite,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.sp,
        color: marvelWhite,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        color: marvelWhite,
      ),
      bodySmall: TextStyle(
        fontSize: 15.sp,
        color: marvelWhite,
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
      backgroundColor: marvelBlueGrey,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: marvelBlueGrey,
        statusBarIconBrightness: Brightness.light,
      ),
      foregroundColor: marvelWhite,
      centerTitle: false,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: marvelGrey,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
