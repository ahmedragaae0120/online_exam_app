// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String placeholder;

  const CustomTextField({
    super.key,
    required this.label,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 34,
              color: Colors.grey[700],
            ),
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            floatingLabelStyle: TextStyle(
              backgroundColor: Colors.transparent,
              fontSize: 20,
            ),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ),
    );
  }
}
