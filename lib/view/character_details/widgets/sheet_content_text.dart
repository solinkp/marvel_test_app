import 'package:flutter/material.dart';

import 'package:marvel_test/res/colors/colors.dart';

class SheetContentText extends StatelessWidget {
  final String title;
  final String text;

  const SheetContentText({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title: $text',
      style: const TextStyle(
        decoration: TextDecoration.underline,
        decorationColor: marvelGrey,
      ),
    );
  }
}
