import 'package:flutter/material.dart';
import 'package:foundation/export.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';

class SignOutImplementation implements SignOutRepository {
  final SignInWithCredentialsRemote remote;
  final TokenLocale locale;

  SignOutImplementation({
    required this.remote,
    required this.locale,
  });

  @override
  TryFuture<ClientFailure, Unit> signOut() async {
    try {
      await locale.delete();

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
      const ClientFailure(
        name: '',
        description: '',
      ),
    );
  }
}
