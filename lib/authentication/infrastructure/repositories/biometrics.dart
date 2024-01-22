import 'package:flutter/material.dart';
import 'package:foundation/export.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';

class BiometricsRepositoryImplementation implements BiometricsRepository {
  final BiometricsLocal local;

  BiometricsRepositoryImplementation({
    required this.local,
  });

  @override
  TryFuture<ClientFailure, Unit> check(Empty empty) async {
    try {
      await local.check();
      return Try.success(unit);
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
