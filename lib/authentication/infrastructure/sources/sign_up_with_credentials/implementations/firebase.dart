import 'package:firebase_auth/firebase_auth.dart';
import 'package:rental_app/authentication/infrastructure/export.dart';
import 'package:flutter/material.dart';

class SignUpWithCredentialsFirebaseImplementation
    implements SignUpWithCredentialsRemote {
  final FirebaseAuth client;
  SignUpWithCredentialsFirebaseImplementation({
    required this.client,
  });

  @override
  Future<SignUpModel> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await client
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        String token = userCredential.credential.toString();
        return SignUpModel(token: token);
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
