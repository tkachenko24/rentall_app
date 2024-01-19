import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

abstract class Injectable {
  Future<void> register(
    GetIt it,
  );
}

class Injector {
  final List<Injectable> injectable;

  Injector({
    required this.injectable,
  });

  Future<void> setup() async {
    for (final provider in injectable) {
      try {
        await provider.register(locator);
      } catch (err) {
        debugPrint(provider.runtimeType.toString());
        debugPrint(err.toString());
      }
    }

    await locator.allReady();
  }
}
