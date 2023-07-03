import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

final publicApiKey = dotenv.env['PUBLIC_KEY'];
final privateApiKey = dotenv.env['PRIVATE_KEY'];