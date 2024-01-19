import 'package:flutter/foundation.dart' show kReleaseMode, kProfileMode;
import 'package:foundation/export.dart';

abstract class ModeSource {
  Future<Mode> load();
}

class ModeSourceImplementation implements ModeSource {
  @override
  Future<Mode> load() async {
    if (kReleaseMode) {
      return Mode.release;
    }
    if (kProfileMode) {
      return Mode.profile;
    }
    return Mode.debug;
  }
}
