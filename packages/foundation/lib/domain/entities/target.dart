import 'package:foundation/export.dart';

class Target extends Entity {
  final String name;

  const Target._(this.name);

  static const Target mobile = Target._('mobile');
  static const Target desktop = Target._('desktop');
  static const Target browser = Target._('browser');
  static const Target other = Target._('other');

  bool get isDesktop => when(desktop: () => true, other: () => false);
  bool get isMobile => when(mobile: () => true, other: () => false);
  bool get isBrowser => when(browser: () => true, other: () => false);
  bool get isOther => when(other: () => true);

  W when<W>({
    W Function()? mobile,
    W Function()? desktop,
    W Function()? browser,
    required W Function() other,
  }) {
    if (desktop != null && this == Target.desktop) {
      return desktop();
    }
    if (browser != null && this == Target.browser) {
      return browser();
    }
    if (mobile != null && this == Target.mobile) {
      return mobile();
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
