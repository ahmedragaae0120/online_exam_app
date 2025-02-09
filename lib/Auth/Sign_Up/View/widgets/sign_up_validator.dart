import 'package:flutter/material.dart';
import 'package:online_exam_app/constants.dart';

class SignUpValidator {
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController phoneNumberController = TextEditingController();
  static TextEditingController userNameController = TextEditingController();
  static TextEditingController confirmPasswordController =
      TextEditingController();

  static GlobalKey<FormState> get formKey => _formKey;
  String? emaillvalidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!RegExp(Constants.RegExValidateEmail).hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? passwordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Password must contain at least one uppercase letter";
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Password must contain at least one number";
    }
    return null;
  }

  String? confirmPasswordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    if (value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  String? userNameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'User name cannot be empty';
    }
    if (value.length > 20) {
      return 'User name cannot be more than 20 characters';
    }
    return null;
  }

  String? firstNameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'First name cannot be empty';
    }
    if (value.length > 20) {
      return 'First name cannot be more than 20 characters';
    }
    return null;
  }

  String? lasttNameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Last name cannot be empty';
    }
    if (value.length > 20) {
      return 'Last name cannot be more than 20 characters';
    }
    return null;
  }

  String? phoneNumberValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    if (value.length > 20) {
      return 'Phone number cannot be more than 20 characters';
    }
    return null;
  }
}
