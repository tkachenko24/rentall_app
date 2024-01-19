import 'dart:async';

import 'package:flutter/foundation.dart';

/// This class was imported from the migration guide for GoRouter 5.0
class RefreshStream extends ChangeNotifier {
  RefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
