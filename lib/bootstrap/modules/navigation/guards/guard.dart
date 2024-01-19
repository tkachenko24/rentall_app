import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract class ScreenGuard {
  FutureOr<String?> call(BuildContext context, GoRouterState state);
}

class ScreenGuards {
  final List<ScreenGuard> guards;

  ScreenGuards(this.guards);

  FutureOr<String?> call(BuildContext context, GoRouterState state) async {
    String? to;
    for (final guard in guards) {
      to = await guard(context, state);

      if (to != null) {
        break;
      }
    }
    return to;
  }
}
