// ignore_for_file: implicit_call_tearoffs

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';

import 'guards/export.dart';
import 'screens/export.dart';
import 'notifiers/export.dart';

typedef RoutingBuilder = Widget Function(
  BuildContext context,
  RouterDelegate<Object> routerDelegate,
  RouteInformationParser<Object> routeInformationParser,
  RouteInformationProvider routeInformationProvider,
);

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation extends StatelessWidget {
  final RoutingBuilder builder;
  final List<Screens> screens = [
    CommonScreens(),
    AuthenticationScreens(),
    DashboardScreens(),
  ];

  Navigation({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: navigatorKey,
      initialLocation: CommonScreens.splash.path,
      refreshListenable: Listenable.merge([
        BlocNotifier(context.read<PreferencesBloc>()),
        BlocNotifier(context.read<AuthenticationBloc>()),
      ]),
      redirect: ScreenGuards([
        BootstrapGuard(),
      ]),
      routes: screens.expand((screen) => screen.routes).toList(),
      errorBuilder: (context, state) => const UnknownScreen(),
    );

    return builder(
      context,
      router.routerDelegate,
      router.routeInformationParser,
      router.routeInformationProvider,
    );
  }
}
