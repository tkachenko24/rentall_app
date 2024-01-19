import 'package:foundation/export.dart';
import 'package:package_info_plus/package_info_plus.dart';

abstract class BundleSource {
  Future<Bundle> load();
}

class BundleSourceImplementation implements BundleSource {
  @override
  Future<Bundle> load() async {
    try {
      final info = await PackageInfo.fromPlatform();

      return Bundle(
        name: info.appName,
        id: info.packageName,
        version: Version.parse('${info.version}+${info.buildNumber}'),
      );
    } catch (error) {
      return Bundle.empty();
    }
  }
}
