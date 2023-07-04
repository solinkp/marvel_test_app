import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel_test/generated/l10n.dart';

import 'package:marvel_test/res/colors/colors.dart';

class DashboardLayout extends StatelessWidget {
  final Widget body;

  const DashboardLayout({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('dashboardLayoutScaffold'),
      appBar: AppBar(title: Text(S.current.appTitle)),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: marvelBlueGrey,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: marvelBlueGrey,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: SafeArea(
          child: Flex(
            direction: Axis.vertical,
            children: [Expanded(child: body)],
          ),
        ),
      ),
    );
  }
}
