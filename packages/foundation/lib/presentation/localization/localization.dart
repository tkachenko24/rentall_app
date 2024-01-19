import 'package:flutter/widgets.dart';

abstract class GeneralLocalization {
  String message(
    String key, {
    List<String>? args,
    Map<String, String>? props,
    String? gender,
    BuildContext? context,
  });
}
