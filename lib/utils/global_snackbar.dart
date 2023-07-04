import 'package:flutter/material.dart';

import 'package:marvel_test/res/constants/global_key.dart';

void showMsnSnackbar(String message) {
  snackbarKey.currentState?.showSnackBar(
    SnackBar(content: Text(message)),
  );
}

void clearSnackbars() {
  snackbarKey.currentState?.clearSnackBars();
}
