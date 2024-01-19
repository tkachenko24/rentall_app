import 'package:rental_app/authentication/infrastructure/export.dart';

abstract class SignUpWithCredentialsRemote {
  Future<SignUpModel> signUp({
    required String email,
    required String password,
  });
}
