import 'package:foundation/export.dart';

abstract class SystemRepository {
  Future<System> load();
}
