import 'package:foundation/export.dart';
import 'package:rental_app/common/export.dart';

abstract class SignOutRepository {
  TryFuture<ClientFailure, Unit> signOut();
}
