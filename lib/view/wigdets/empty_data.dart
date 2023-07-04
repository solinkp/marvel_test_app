import 'package:flutter/material.dart';

import 'package:marvel_test/generated/l10n.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.current.emptyDataMsg,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
