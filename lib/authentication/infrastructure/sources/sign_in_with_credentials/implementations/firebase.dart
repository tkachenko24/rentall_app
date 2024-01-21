import 'package:firebase_auth/firebase_auth.dart';
import 'package:rental_app/authentication/infrastructure/export.dart';
import 'package:flutter/material.dart';

class SignInWithCredentialsFirebaseImplementation
    implements SignInWithCredentialsRemote {
  final FirebaseAuth client;
  SignInWithCredentialsFirebaseImplementation({
    required this.client,
  });

  @override
  Future<SignInModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await client.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        String? token = userCredential.user?.refreshToken.toString();
        return SignInModel(token: token ?? 'token');
      }
    } catch (error) {
      debugPrint(error.toString());
    }

    throw const SignInExceptions(
      name: 'OTHER_ERROR',
      description: 'Wrong credentials',
    );
  }
}
