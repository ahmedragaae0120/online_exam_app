import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.placeholder,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final inputTheme = Theme.of(context).inputDecorationTheme;

    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            labelText: label,
            hintText: placeholder,
            labelStyle: inputTheme.labelStyle,
            hintStyle: inputTheme.hintStyle,
            floatingLabelBehavior: inputTheme.floatingLabelBehavior,
            border: inputTheme.border,
            enabledBorder: inputTheme.enabledBorder,
            focusedBorder: inputTheme.focusedBorder,
            contentPadding: inputTheme.contentPadding,
            fillColor: inputTheme.fillColor,
            filled: inputTheme.filled,
          ),
        ),
      ),
    );
  }
}
