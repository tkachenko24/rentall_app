import 'dart:ui' as ui
    show FontFeature, FontVariation, Shadow, TextLeadingDistribution;
import 'package:flutter/widgets.dart';

class TypographyWeight {
  TypographyWeight._();

  static const FontWeight thin = FontWeight.w100;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class TypographyStyle extends TextStyle {
  const TypographyStyle({
    super.color,
    super.backgroundColor,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.leadingDistribution,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.fontVariations,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel,
    super.fontFamily,
    super.fontFamilyFallback,
    super.package,
    super.overflow,
  });

  TextStyle call({
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    ui.TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<ui.Shadow>? shadows,
    List<ui.FontFeature>? fontFeatures,
    List<ui.FontVariation>? fontVariations,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? package,
    TextOverflow? overflow,
  }) {
    return copyWith(
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      leadingDistribution: leadingDistribution,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      fontVariations: fontVariations,
      decoration: decoration,
      decorationThickness: decorationThickness,
      debugLabel: debugLabel,
      package: package,
      overflow: overflow,
    );
  }

  TypographyStyle copy(TextStyle? other) {
    if (other == null) {
      return this;
    }
    return TypographyStyle(
      color: foreground == null && other.foreground == null
          ? other.color ?? color
          : null,
      backgroundColor: background == null && other.background == null
          ? other.backgroundColor ?? backgroundColor
          : null,
      fontSize: other.fontSize ?? fontSize,
      fontWeight: other.fontWeight ?? fontWeight,
      fontStyle: other.fontStyle ?? fontStyle,
      letterSpacing: other.letterSpacing ?? letterSpacing,
      wordSpacing: other.wordSpacing ?? wordSpacing,
      textBaseline: other.textBaseline ?? textBaseline,
      height: other.height ?? height,
      leadingDistribution: other.leadingDistribution ?? leadingDistribution,
      locale: other.locale ?? locale,
      foreground: other.foreground ?? foreground,
      background: other.background ?? background,
      shadows: other.shadows ?? shadows,
      fontFeatures: other.fontFeatures ?? fontFeatures,
      fontVariations: other.fontVariations ?? fontVariations,
      decoration: other.decoration ?? decoration,
      decorationColor: other.decorationColor ?? decorationColor,
      decorationStyle: other.decorationStyle ?? decorationStyle,
      decorationThickness: other.decorationThickness ?? decorationThickness,
      overflow: other.overflow ?? overflow,
    );
  }
}

class TypographyScheme extends TypographyStyle {
  final TypographyStyle displayLarge;

  final TypographyStyle displayMedium;

  final TypographyStyle displaySmall;

  final TypographyStyle headlineLarge;

  final TypographyStyle headlineMedium;

  final TypographyStyle headlineSmall;

  final TypographyStyle titleLarge;

  final TypographyStyle titleMedium;

  final TypographyStyle titleSmall;

  final TypographyStyle bodyLarge;

  final TypographyStyle bodyMedium;

  final TypographyStyle bodySmall;

  final TypographyStyle labelLarge;

  final TypographyStyle labelMedium;

  final TypographyStyle labelSmall;

  TypographyScheme(
    String fontFamily, {
    displayLarge,
    displayMedium,
    displaySmall,
    headlineLarge,
    headlineMedium,
    headlineSmall,
    titleLarge,
    titleMedium,
    titleSmall,
    bodyLarge,
    bodyMedium,
    bodySmall,
    labelLarge,
    labelMedium,
    labelSmall,
  })  : displayLarge = TypographyStyle(
          color: null,
          fontSize: 57,
          height: 64 / 57,
          wordSpacing: 0,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(displayLarge),
        displayMedium = TypographyStyle(
          color: null,
          fontSize: 45,
          height: 52 / 45,
          wordSpacing: 0,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(displayMedium),
        displaySmall = TypographyStyle(
          color: null,
          fontSize: 36,
          height: 44 / 36,
          wordSpacing: 0,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(displaySmall),
        headlineLarge = TypographyStyle(
          color: null,
          fontSize: 32,
          height: 40 / 32,
          wordSpacing: 0,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(headlineLarge),
        headlineMedium = TypographyStyle(
          color: null,
          fontSize: 28,
          height: 36 / 28,
          wordSpacing: 0,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(headlineMedium),
        headlineSmall = TypographyStyle(
          color: null,
          fontSize: 24,
          height: 32 / 24,
          wordSpacing: 0,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(headlineSmall),
        titleLarge = TypographyStyle(
          color: null,
          fontSize: 22,
          height: 28 / 22,
          wordSpacing: 0,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.medium,
        ).copy(titleLarge),
        titleMedium = TypographyStyle(
          color: null,
          fontSize: 16,
          height: 24 / 16,
          wordSpacing: 0.15,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.medium,
        ).copy(titleMedium),
        titleSmall = TypographyStyle(
          color: null,
          fontSize: 14,
          height: 20 / 14,
          wordSpacing: 0.1,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.medium,
        ).copy(titleSmall),
        bodyLarge = TypographyStyle(
          color: null,
          fontSize: 14,
          height: 20 / 14,
          wordSpacing: 0.1,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.medium,
        ).copy(bodyLarge),
        bodyMedium = TypographyStyle(
          color: null,
          fontSize: 12,
          height: 16 / 12,
          wordSpacing: 0.5,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.medium,
        ).copy(bodyMedium),
        bodySmall = TypographyStyle(
          color: null,
          fontSize: 11,
          height: 16 / 11,
          wordSpacing: 0.5,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.medium,
        ).copy(bodySmall),
        labelLarge = TypographyStyle(
          color: null,
          fontSize: 16,
          height: 24 / 16,
          wordSpacing: 0.15,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(labelLarge),
        labelMedium = TypographyStyle(
          color: null,
          fontSize: 14,
          height: 20 / 14,
          wordSpacing: 0.25,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(labelMedium),
        labelSmall = TypographyStyle(
          color: null,
          fontSize: 12,
          height: 16 / 12,
          wordSpacing: 0.4,
          fontFamily: fontFamily,
          fontWeight: TypographyWeight.regular,
        ).copy(labelSmall),
        super(
          fontFamily: fontFamily,
          color: null,
        );
}
