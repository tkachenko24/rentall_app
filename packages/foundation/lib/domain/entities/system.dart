import 'package:foundation/export.dart';

class System extends Entity {
  final Mode mode;
  final Target target;
  final Bundle bundle;
  final GeneralPlatform platform;

  const System({
    required this.mode,
    required this.target,
    required this.bundle,
    required this.platform,
  });

  factory System.empty() {
    return System(
      mode: Mode.debug,
      target: Target.other,
      bundle: Bundle.empty(),
      platform: GeneralPlatform.other,
    );
  }

  @override
  List<Object?> get props => [mode, target, bundle, platform];
}
