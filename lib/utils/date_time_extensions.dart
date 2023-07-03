import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  String getFormattedDate() {
    final String fMonth = month < 10 ? '0$month' : '$month';
    final String fDay = day < 10 ? '0$day' : '$day';
    return '$year-$fMonth-$fDay';
  }
}

extension TimeOfDayExtension on TimeOfDay {
  String getFormattedTime() {
    final String fHour = hour < 10 ? '0$hour' : '$hour';
    final String fMinute = minute < 10 ? '0$minute' : '$minute';
    return '$fHour:$fMinute';
  }
}
