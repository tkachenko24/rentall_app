import 'package:flutter/material.dart';
import 'package:foundation/export.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';

class SignUpWithCredentialsImplementation
    implements SignUpWithCredentialsRepository {
  final SignUpWithCredentialsRemote remote;
  final TokenLocale locale;

  SignUpWithCredentialsImplementation({
    required this.remote,
    required this.locale,
  });

  @override
  TryFuture<ClientFailure, Unit> signUp(SignUp credentials) async {
    try {
      final token = await remote.signUp(
        email: credentials.username,
        password: credentials.password,
      );
      await locale.set(
        TokenModel(
          token: token.token,
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
