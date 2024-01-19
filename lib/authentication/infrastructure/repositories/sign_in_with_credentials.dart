import 'package:flutter/foundation.dart';
import 'package:foundation/export.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';

class SignInWithCredentialsImplementation
    implements SignInWithCredentialsRepository {
  final SignInWithCredentialsRemote remote;
  final TokenLocale locale;

  SignInWithCredentialsImplementation({
    required this.remote,
    required this.locale,
  });

  @override
  TryFuture<ClientFailure, Unit> signIn(SignIn credentials) async {
    try {
      final response = await remote.signIn(
        email: credentials.username,
        password: credentials.password,
      );

      await locale.set(
        TokenModel(
          token: response.token,
        ),
      );

      return Try.success(unit);
    } on SignInExceptions catch (error) {
      return Try.failed(
        ClientFailure(
          name: error.name,
          description: error.description,
        ),
      );
    } catch (err) {
      debugPrint(err.toString());
    }
    return Try.failed(
      const ClientOtherFailure(),
    );
  }
}
