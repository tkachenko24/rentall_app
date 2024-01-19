import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;
import 'package:foundation/export.dart';

abstract class PlatformSource {
  Future<GeneralPlatform> load();
}

class PlatformSourceImplementation implements PlatformSource {
  @override
  Future<GeneralPlatform> load() async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return GeneralPlatform.iOS;
    }

    if (defaultTargetPlatform == TargetPlatform.android) {
      return GeneralPlatform.android;
    }

    if (defaultTargetPlatform == TargetPlatform.windows) {
      return GeneralPlatform.windows;
    }
    if (defaultTargetPlatform == TargetPlatform.macOS) {
      return GeneralPlatform.macOS;
    }
    if (defaultTargetPlatform == TargetPlatform.linux) {
      return GeneralPlatform.linux;
    }

    if (defaultTargetPlatform == TargetPlatform.fuchsia) {
      return GeneralPlatform.fuchsia;
    }

    return GeneralPlatform.other;
  }
}
