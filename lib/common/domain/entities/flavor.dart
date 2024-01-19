import 'package:foundation/export.dart';

class Flavor extends Entity {
  final String name;

  const Flavor._(this.name);

  static const Flavor development = Flavor._('development');
  static const Flavor production = Flavor._('production');
  static const Flavor staging = Flavor._('staging');

  bool get isDevelopment => when(development: () => true, other: () => false);
  bool get isProduction => when(production: () => true, other: () => false);
  bool get isStaging => when(staging: () => true, other: () => false);

  W when<W>({
    W Function()? development,
    W Function()? production,
    W Function()? staging,
    required W Function() other,
  }) {
    if (development != null && this == Flavor.development) {
      return development();
    }

    if (production != null && this == Flavor.production) {
      return production();
    }

    if (staging != null && this == Flavor.staging) {
      return staging();
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
