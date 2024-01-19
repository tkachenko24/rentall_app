import 'package:rental_app/authentication/infrastructure/export.dart';

abstract class SignInWithCredentialsRemote {
  Future<SignInModel> signIn({
    required String email,
    required String password,
  });
}
