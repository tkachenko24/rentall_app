import 'package:foundation/export.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';

abstract class SignInWithCredentialsRepository {
  TryFuture<ClientFailure, Unit> signIn(SignIn credentials);
}
