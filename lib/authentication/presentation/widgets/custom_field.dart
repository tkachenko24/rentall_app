import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.error,
    required this.textInputType,
    required this.onChanged,
    required this.errorHint,
    required this.label,
  });
  final TextInputType textInputType;
  final String? error, errorHint, label;

  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
          errorText: error != null ? errorHint : null,
          labelText: error ?? label,
          errorMaxLines: 5,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      onChanged: onChanged,
    );
  }
}
