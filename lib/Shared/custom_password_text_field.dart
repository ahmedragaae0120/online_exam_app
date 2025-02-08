// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final String label;
  final String placeholder = 'Password';

  const CustomPasswordField({
    super.key,
    required this.label,
  });

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true; // Controls password visibility

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
    // Debugging log
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            obscureText: _obscureText, // Toggle password visibility
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
              ),
              hintText: widget.placeholder,
              hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              floatingLabelBehavior:
                  FloatingLabelBehavior.always, // Keeps the label visible
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: _togglePasswordVisibility,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        );
      },
    );
  }
}
