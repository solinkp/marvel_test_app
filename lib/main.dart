import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marvel_test/view/marvel_main.dart';
import 'package:marvel_test/di/injection.dart' as di;

void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await di.configure();

  runApp(const ProviderScope(child: MarvelMain()));
}
