import 'package:flutter/material.dart';
import 'package:rental_app/common/presentation/export.dart';

class CardSpan extends StatelessWidget {
  const CardSpan({
    super.key,
    required this.value,
    required this.title,
  });

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: title,
          style: Fonts.bodyLarge,
          children: [TextSpan(text: value, style: Fonts.titleMedium)]),
    );
  }
}
