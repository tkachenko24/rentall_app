import 'package:flutter/material.dart';

import 'gradients.dart';

class CommonTheme extends ThemeExtension<CommonTheme> {
  final Gradient? splashGradient;

  CommonTheme({
    required this.splashGradient,
  });

  @override
  ThemeExtension<CommonTheme> copyWith({
    Gradient? splashGradient,
  }) {
    return CommonTheme(
      splashGradient: splashGradient ?? this.splashGradient,
    );
  }

  @override
  ThemeExtension<CommonTheme> lerp(
    covariant ThemeExtension<CommonTheme>? other,
    double t,
  ) {
    if (other is! CommonTheme) {
      return this;
    }

    return CommonTheme(
      splashGradient: Gradient.lerp(
        splashGradient,
        other.splashGradient,
        t,
      ),
    );
  }

  static final light = CommonTheme(
    splashGradient: Gradients.primary,
  );

  static final dark = CommonTheme(
    splashGradient: Gradients.primary,
  );
}
