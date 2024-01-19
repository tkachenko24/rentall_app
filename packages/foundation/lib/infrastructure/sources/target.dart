import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:foundation/export.dart';

abstract class TargetSource {
  Future<Target> load();
}

class TargetSourceImplementation implements TargetSource {
  @override
  Future<Target> load() async {
    if (kIsWeb) {
      return Target.browser;
    }

    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      return Target.desktop;
    }

    if (Platform.isAndroid || Platform.isIOS) {
      return Target.mobile;
    }

    return Target.other;
  }
}
