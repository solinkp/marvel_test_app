import 'package:auto_route/auto_route.dart';

import 'package:marvel_test/utils/routes/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<CustomRoute> routes = [
    CustomRoute(
      initial: true,
      path: '/dashboard',
      page: DashboardRoute.page,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      path: '/superheroDetails',
      page: CharacterDetailsRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
  ];
}
