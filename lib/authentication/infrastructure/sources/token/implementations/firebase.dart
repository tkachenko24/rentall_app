import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/authentication/infrastructure/export.dart';

import 'package:foundation/export.dart';

class TokenFirebaseImplementation implements TokenLocale {
  final _controller = StreamController<TokenStatusModel>();

  final FirebaseAuth storage;
  final BiometricsLocal biometrics;
  final Mapper<Map<String, dynamic>, TokenModel> mapper;

  String get key => 'TOKEN_STORAGE';

  TokenFirebaseImplementation({
    required this.storage,
    required this.mapper,
    required this.biometrics,
  });

  @override
  Future<void> set(
    TokenModel value,
  ) async {
    try {
      User? credential = storage.currentUser;

      if (credential != null) {
        _controller.add(TokenStatusModel.exist);
      }
    } catch (error) {
      debugPrint(error.toString());
      throw TokenException();
    }
  }

  @override
  Future<void> delete() async {
    try {
      storage.signOut();
      _controller.add(TokenStatusModel.empty);
    } catch (error) {
      throw TokenException();
    }
  }

  @override
  Future<TokenModel> get() async {
    try {
      String? value = await storage.currentUser?.getIdToken();

      if (value != null) {
        final data = json.decode(value);
        return mapper.map(data);
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    throw TokenException();
  }

  @override
  Future<bool> has() async {
    try {
      String? token = await storage.currentUser?.getIdToken();
      return token != null ? await biometrics.check() : false;
    } catch (error) {
      throw TokenException();
    }
  }

  @override
  Stream<TokenStatusModel> get status async* {
    final has = await this.has();

    if (has) {
      yield TokenStatusModel.exist;
    } else {
      yield TokenStatusModel.empty;
    }

    yield* _controller.stream.asBroadcastStream();
  }
}
