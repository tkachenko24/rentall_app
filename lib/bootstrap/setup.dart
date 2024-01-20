import 'dart:async';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'injectable/export.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';

import 'modules/export.dart';

Future<void> setup() async {
  final injector = Injector(
    injectable: [
      CommonInjectable(),
      AuthenticationInjectable(),
    ],
  );

  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    injector.setup(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
  ]);

  final signOut = SignOutBloc(signOut: locator.get());
  final authentication = AuthenticationBloc(check: locator.get());
  print(authentication.state);
  final preferences = PreferencesBloc((PreferencesState state) async {
    print(authentication.state);
    if (authentication.state.isOther) {
      print('object');
      await for (final event in authentication.stream) {
        if (event != Authentication.other) break;
      }
    }
  });
  print(authentication.state);
  print(preferences.state.status);

  final providers = [
    BlocProvider.value(value: signOut),
    BlocProvider.value(value: preferences),
    BlocProvider.value(value: authentication),
  ];

  final List<SingleChildWidget> listeners = [
    BlocListener<AuthenticationBloc, Authentication>(
      listener: (context, state) {
        preferences.add(const Initialization());
      },
    ),
  ];

  runApp(
    MultiProvider(
      providers: providers,
      child: MultiBlocListener(
        listeners: listeners,
        child: Navigation(
          builder: (
            context,
            routerDelegate,
            routeInformationParser,
            routeInformationProvider,
          ) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: FlexThemeData.light(
                  useMaterial3: true, scheme: FlexScheme.greenM3),
              routerDelegate: routerDelegate,
              routeInformationParser: routeInformationParser,
              routeInformationProvider: routeInformationProvider,
            );
          },
        ),
      ),
    ),
  );
}
