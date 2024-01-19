import 'package:foundation/export.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';

abstract class SignUpWithCredentialsRepository {
  TryFuture<ClientFailure, Unit> signUp(SignUp credentials);
}
