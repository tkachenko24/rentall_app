import 'package:foundation/export.dart';

class Fonts {
  Fonts._();

  static TypographyScheme get roboto {
    return TypographyScheme('Roboto');
  }

  // Default Font
  static TypographyScheme get main => Fonts.roboto;

  static TypographyStyle get displayLarge => Fonts.main.displayLarge;
  static TypographyStyle get displayMedium => Fonts.main.displayMedium;
  static TypographyStyle get displaySmall => Fonts.main.displaySmall;

  static TypographyStyle get headlineLarge => Fonts.main.headlineLarge;
  static TypographyStyle get headlineMedium => Fonts.main.headlineMedium;
  static TypographyStyle get headlineSmall => Fonts.main.headlineSmall;

  static TypographyStyle get titleLarge => Fonts.main.titleLarge;
  static TypographyStyle get titleMedium => Fonts.main.titleMedium;
  static TypographyStyle get titleSmall => Fonts.main.titleSmall;

  static TypographyStyle get bodyLarge => Fonts.main.bodyLarge;
  static TypographyStyle get bodyMedium => Fonts.main.bodyMedium;
  static TypographyStyle get bodySmall => Fonts.main.bodySmall;

  static TypographyStyle get labelLarge => Fonts.main.labelLarge;
  static TypographyStyle get labelMedium => Fonts.main.labelMedium;
  static TypographyStyle get labelSmall => Fonts.main.labelSmall;
}
