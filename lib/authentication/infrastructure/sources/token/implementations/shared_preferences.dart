import 'dart:async';

import 'package:rental_app/authentication/export.dart';
import 'package:foundation/export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TokenSharedPreferencesImplementation implements TokenLocale {
  final _controller = StreamController<TokenStatusModel>();

  final SharedPreferences storage;
  final Mapper<Map<String, dynamic>, TokenModel> mapper;

  String get key => 'TOKEN_STORAGE';

  TokenSharedPreferencesImplementation({
    required this.storage,
    required this.mapper,
  });

  @override
  Future<void> set(TokenModel value) async {
    try {
      await storage.setString(
        key,
        json.encode(
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
      await storage.remove(key);
      _controller.add(TokenStatusModel.empty);
    } catch (error) {
      throw TokenException();
    }
  }

  @override
  Future<TokenModel> get() async {
    try {
      String? value = storage.getString(key);
      if (value != null) {
        final data = json.decode(value);

        return mapper.map(data);
      }
      throw TokenException();
    } catch (error) {
      throw TokenException();
    }
  }

  @override
  Future<bool> has() async {
    try {
      String? value = storage.getString(key);
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
