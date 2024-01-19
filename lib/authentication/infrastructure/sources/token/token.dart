import 'dart:async';
import 'package:rental_app/authentication/export.dart';

abstract class TokenLocale<T> {
  Future<TokenModel> get();

  Future<void> set(TokenModel value);

  Future<void> delete();

  Future<bool> has();

  Stream<TokenStatusModel> get status;
}
