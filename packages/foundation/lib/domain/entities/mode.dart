import 'package:foundation/export.dart';

class Mode extends Entity {
  final String name;

  const Mode._(this.name);

  static const Mode debug = Mode._('debug');
  static const Mode profile = Mode._('profile');
  static const Mode release = Mode._('release');

  bool get isDebug => when(debug: () => true, other: () => false);
  bool get isProfile => when(profile: () => true, other: () => false);
  bool get isRelease => when(release: () => true, other: () => false);

  W when<W>({
    W Function()? debug,
    W Function()? profile,
    W Function()? release,
    required W Function() other,
  }) {
    if (debug != null && this == Mode.debug) {
      return debug();
    }

    if (profile != null && this == Mode.profile) {
      return profile();
    }

    if (release != null && this == Mode.release) {
      return release();
    }

    return other();
  }

  @override
  List<Object?> get props => [name];

  @override
  String toString() {
    return name;
  }
}
