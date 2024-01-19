import 'package:foundation/export.dart';

class GeneralPlatform extends Entity {
  final String name;

  const GeneralPlatform._(this.name);

  static const GeneralPlatform macOS = GeneralPlatform._('macOS');
  static const GeneralPlatform windows = GeneralPlatform._('windows');
  static const GeneralPlatform linux = GeneralPlatform._('linux');
  static const GeneralPlatform iOS = GeneralPlatform._('ios');
  static const GeneralPlatform android = GeneralPlatform._('android');
  static const GeneralPlatform fuchsia = GeneralPlatform._('fuchsia');
  static const GeneralPlatform other = GeneralPlatform._('other');

  bool get isWindows => when(windows: () => true, other: () => false);
  bool get isLinux => when(linux: () => true, other: () => false);
  bool get isAndroid => when(android: () => true, other: () => false);
  bool get isMacOS => when(macos: () => true, other: () => false);
  bool get isIOS => when(ios: () => true, other: () => false);
  bool get isFuchsia => when(fuchsia: () => true, other: () => false);
  bool get isOther => when(other: () => true);

  W when<W>({
    W Function()? windows,
    W Function()? linux,
    W Function()? macos,
    W Function()? ios,
    W Function()? android,
    W Function()? fuchsia,
    required W Function() other,
  }) {
    if (macos != null && this == GeneralPlatform.iOS) {
      return macos();
    }
    if (linux != null && this == GeneralPlatform.linux) {
      return linux();
    }
    if (windows != null && this == GeneralPlatform.windows) {
      return windows();
    }

    if (ios != null && this == GeneralPlatform.iOS) {
      return ios();
    }

    if (android != null && this == GeneralPlatform.android) {
      return android();
    }

    if (fuchsia != null && this == GeneralPlatform.fuchsia) {
      return fuchsia();
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
