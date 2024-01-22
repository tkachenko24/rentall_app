import 'package:foundation/export.dart';

import 'package:rental_app/common/export.dart';

abstract class BiometricsRepository {
  TryFuture<ClientFailure, Unit> check(Empty empty);
}
