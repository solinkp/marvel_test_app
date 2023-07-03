import 'package:flutter/material.dart' hide Router;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:marvel_test/generated/l10n.dart';
import 'package:marvel_test/res/style/app_theme.dart';
import 'package:marvel_test/utils/routes/router.dart';
import 'package:marvel_test/res/constants/global_key.dart';

final appRouter = AppRouter();

class MarvelMain extends StatelessWidget {
  const MarvelMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, _) => const MarvelApp(),
      minTextAdapt: true,
      designSize: const Size(360, 640),
    );
  }
}

class MarvelApp extends ConsumerWidget {
  const MarvelApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: snackbarKey,
      theme: AppTheme.lightTheme,
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData media = MediaQuery.of(context);
        return MediaQuery(
          data: media.copyWith(
            textScaleFactor: media.textScaleFactor.clamp(1.0, 1.3),
          ),
          child: child!,
        );
      },
      onGenerateTitle: (context) => S.current.appTitle,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: appRouter.config(),
    );
  }
}
