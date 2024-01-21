// ignore_for_file: implicit_call_tearoffs

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/bootstrap/injectable/export.dart';
import 'package:rental_app/common/export.dart';
import 'package:rental_app/dashboard/export.dart';
import 'package:rental_app/dashboard/presentation/screens/detail_car_screen/export.dart';

import '../guards/export.dart';
import 'screens.dart';

class DashboardScreens extends Screens {
  static Screen dashboard = Screen(path: '/dashboard');

  static Screen newCar = Screen(path: '$dashboard/new-car');
  static Screen detailCarScreen = Screen(path: '$dashboard/detail-car-screen');

  @override
  List<RouteBase> routes = [
    GoRoute(
      path: dashboard.path,
      name: dashboard.name,
      redirect: ScreenGuards([AuthenticationGuard(), BootstrapGuard()]),
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => CarsBloc(
            fetch: locator.get(),
            delete: locator.get(),
            addCar: locator.get(),
            editCar: locator.get(),
          ),
          child: DashboardScreen(
            signOut: () => context.read<SignOutBloc>().add(SignOutSubmitted()),
            addCar: () => context.goNamed(newCar.name),
            theme: Theme.of(context),
            car: (index) => context.goNamed(detailCarScreen.name, extra: index),
          ),
        );
      },
    ),
    GoRoute(
      path: newCar.path,
      name: newCar.name,
      redirect: ScreenGuards([AuthenticationGuard(), BootstrapGuard()]),
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => CarsBloc(
            fetch: locator.get(),
            delete: locator.get(),
            addCar: locator.get(),
            editCar: locator.get(),
          ),
          child: NewCarScreen(
            toDashboard: () => context.goNamed(dashboard.name),
            onSuccessSave: () => context.goNamed(dashboard.name),
          ),
        );
      },
    ),
    GoRoute(
      path: detailCarScreen.path,
      name: detailCarScreen.name,
      redirect: ScreenGuards([AuthenticationGuard(), BootstrapGuard()]),
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => CarsBloc(
            fetch: locator.get(),
            delete: locator.get(),
            addCar: locator.get(),
            editCar: locator.get(),
          ),
          child: DetailCarScreen(
            car: state.extra as int,
            back: () => context.goNamed(dashboard.name),
            theme: Theme.of(context),
          ),
        );
      },
    ),
  ];
}
