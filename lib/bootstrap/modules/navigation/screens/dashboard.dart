import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_app/dashboard/export.dart';

import '../guards/export.dart';
import 'screens.dart';

class DashboardScreens extends Screens {
  static Screen dashboard = Screen(path: '/dashboard');

  @override
  List<RouteBase> routes = [
    GoRoute(
      path: dashboard.path,
      name: dashboard.name,
      redirect: ScreenGuards([AuthenticationGuard(), BootstrapGuard()]),
      builder: (BuildContext context, GoRouterState state) {
        return DashboardScreen(
          signOut: () {},
        );
      },
    )
  ];
}
