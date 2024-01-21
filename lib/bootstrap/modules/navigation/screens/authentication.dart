// ignore_for_file: implicit_call_tearoffs

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/bootstrap/injectable/export.dart';
import 'package:rental_app/bootstrap/modules/navigation/screens/export.dart';

import '../guards/export.dart';

class AuthenticationScreens extends Screens {
  static String route = '/authentication';

  static Screen signIn = Screen(path: '$route/sign-in');

  static Screen signUp = Screen(path: '$route/sign-up');

  static Screen dashboard = Screen(path: '/dashboard');

  @override
  List<RouteBase> routes = [
    GoRoute(
      path: signIn.path,
      name: signIn.name,
      redirect: ScreenGuards([
        BootstrapGuard(),
      ]),
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider<SignInBloc>(
          create: (context) {
            return SignInBloc(signIn: locator.get());
          },
          child: SignInScreen(
            onSignUp: () {
              context.goNamed(signUp.name);
            },
            onSubmitted: () => context.go(dashboard.path),
          ),
        );
      },
    ),
    GoRoute(
      path: signUp.path,
      name: signUp.name,
      redirect: ScreenGuards([
        BootstrapGuard(),
      ]),
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider<SignUpBloc>(
          create: (context) {
            return SignUpBloc(signUp: locator.get());
          },
          child: SignUpScreen(
            onSignIn: () {
              context.goNamed(signIn.name);
            },
            onSubmitted: () => context.go(dashboard.path),
          ),
        );
      },
    ),
  ];
}
