import 'package:dio/dio.dart';
import 'package:rental_app/authentication/infrastructure/export.dart';
import 'package:flutter/material.dart';

class SignInWithCredentialsDioImplementation
    implements SignInWithCredentialsRemote {
  final Dio client;
  SignInWithCredentialsDioImplementation({
    required this.client,
  });

  @override
  Future<SignInModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await client.post('api/login', data: {
        'email': email,
        'password': password,
      });

      return SignInModel(
        token: response.data['token'],
      );
    } on DioException catch (error) {
      debugPrint(error.toString());
      if (error.response?.data['error'] != null) {
        throw SignInExceptions(
          name: error.response?.data['error'] ?? '',
          description: error.response?.data['error_description'] ?? '',
        );
      }
    } catch (error) {
      debugPrint(error.toString());
    }

    throw const SignInExceptions(
      name: 'OTHER_ERROR',
      description: 'OTHER_ERROR',
    );
  }
}
