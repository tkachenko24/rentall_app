import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';

import '../screens/export.dart';

import 'guard.dart';

class AuthenticationGuard extends ScreenGuard {
  @override
  String? call(BuildContext context, GoRouterState state) {
    final authentication = context.read<AuthenticationBloc>();
    final preferences = context.read<PreferencesBloc>();
    final isPreferences = preferences.state.isFinish();
    final bool isUnAuthenticated = authentication.state.isUnauthenticated;
    final bool isAuthenticated = authentication.state.isAuthenticated;

    final bool isAuthenticationScreens = state.matchedLocation.contains(
      AuthenticationScreens.route,
    );

    if (isUnAuthenticated && isPreferences && !isAuthenticationScreens) {
      return AuthenticationScreens.signIn.path;
    }

    if (isAuthenticated && isAuthenticationScreens && isPreferences) {
      return DashboardScreens.dashboard.path;
    }

    return null;
  }
}
