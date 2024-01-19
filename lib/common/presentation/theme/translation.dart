import 'package:foundation/export.dart';

class CommonTranslation extends GeneralTranslation {
  CommonTranslation({
    required super.localization,
  });

  String get common => localization.message('auth.accept');
}

class ErrorsTranslation extends GeneralTranslation {
  ErrorsTranslation({
    required super.localization,
  });
}
