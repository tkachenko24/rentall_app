import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rental_app/authentication/infrastructure/export.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'dart:convert';

import 'package:foundation/export.dart';

class TokenFlutterSecureStorageImplementation implements TokenLocale {
  final _controller = StreamController<TokenStatusModel>();

  final FlutterSecureStorage storage;
  final Mapper<Map<String, dynamic>, TokenModel> mapper;

  String get key => 'TOKEN_STORAGE';

  TokenFlutterSecureStorageImplementation({
    required this.storage,
    required this.mapper,
  });

  @override
  Future<void> set(
    TokenModel value,
  ) async {
    try {
      await storage.write(
        key: key,
        value: json.encode(
          mapper.restore(value),
        ),
      );
      _controller.add(TokenStatusModel.exist);
    } catch (error) {
      throw TokenException();
    }
  }

  @override
  Future<void> delete() async {
    try {
      await storage.delete(key: key);
      _controller.add(TokenStatusModel.empty);
    } catch (error) {
      throw TokenException();
    }
  }

  @override
  Future<TokenModel> get() async {
    try {
      String? value = await storage.read(key: key);

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
      String? value = await storage.read(key: key);
      return value != null;
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

    yield* _controller.stream;
  }
}
