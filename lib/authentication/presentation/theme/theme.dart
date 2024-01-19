import 'package:flutter/material.dart';

class AuthenticationTheme extends ThemeExtension<AuthenticationTheme> {
  AuthenticationTheme();

  @override
  ThemeExtension<AuthenticationTheme> copyWith({
    Gradient? primary,
  }) {
    return AuthenticationTheme();
  }

  @override
  ThemeExtension<AuthenticationTheme> lerp(
    covariant ThemeExtension<AuthenticationTheme>? other,
    double t,
  ) {
    if (other is! AuthenticationTheme) {
      return this;
    }

    return AuthenticationTheme();
  }

  static final light = AuthenticationTheme();

  static final dark = AuthenticationTheme();
}
