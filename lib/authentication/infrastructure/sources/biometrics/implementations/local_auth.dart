import 'package:local_auth/local_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/authentication/infrastructure/sources/biometrics/export.dart';

class BiometricsLocalImplementation implements BiometricsLocal {
  final LocalAuthentication local;
  BiometricsLocalImplementation({required this.local});

  @override
  Future<bool> check() async {
    try {
      final result = await local.canCheckBiometrics;
      if (result) {
        return local.authenticate(localizedReason: 'User check');
      } else {
        return false;
      }
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }
}
