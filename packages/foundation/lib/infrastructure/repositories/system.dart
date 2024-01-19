import 'package:foundation/export.dart';

class StreamRepositoryImplementation implements SystemRepository {
  final TargetSource target;
  final ModeSource mode;
  final PlatformSource platform;
  final BundleSource bundle;

  StreamRepositoryImplementation({
    required this.target,
    required this.mode,
    required this.platform,
    required this.bundle,
  });

  @override
  Future<System> load() async {
    return System(
      mode: await mode.load(),
      target: await target.load(),
      platform: await platform.load(),
      bundle: await bundle.load(),
    );
  }
}
