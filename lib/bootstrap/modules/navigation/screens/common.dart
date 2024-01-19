import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_app/common/export.dart';

import 'screens.dart';

class CommonScreens extends Screens {
  static Screen splash = Screen(path: '/splash');

  static Screen error = Screen(path: '/error');

  @override
  List<RouteBase> routes = [
    GoRoute(
      path: splash.path,
      name: splash.name,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: error.path,
      name: error.name,
      builder: (BuildContext context, GoRouterState state) {
        return const ErrorScreen();
      },
    ),
  ];
}
