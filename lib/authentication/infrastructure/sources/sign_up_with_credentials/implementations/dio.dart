import 'package:dio/dio.dart';
import 'package:rental_app/authentication/infrastructure/export.dart';
import 'package:flutter/material.dart';

class SignUpWithCredentialsDioImplementation
    implements SignUpWithCredentialsRemote {
  final Dio client;

  SignUpWithCredentialsDioImplementation({
    required this.client,
  });

  @override
  Future<SignUpModel> signUp({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await client.post(
        'api/register',
        data: {
          'email': email,
          'password': password,
        },
      );
      return SignUpModel(
        token: response.data['token'],
      );
    } on DioException catch (error) {
      debugPrint(error.toString());
      if (error.response?.data['error'] != null) {
        throw SignUpExceptions(
          name: error.response?.data['error'] ?? '',
          description: error.response?.data['error_description'] ?? '',
        );
      }
    } catch (error) {
      debugPrint(error.toString());
    }

    throw const SignUpExceptions(
      name: 'OTHER_ERROR',
      description: 'OTHER_ERROR',
    );
  }
}
