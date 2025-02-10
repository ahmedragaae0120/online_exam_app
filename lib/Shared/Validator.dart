// ignore_for_file: file_names

import 'package:online_exam_app/constants.dart';

class Validator {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!RegExp(Constants.regExValidateEmail).hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? password(String? value) {
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

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }

    if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }

  static String? userName(String? value) {
    if (value == null || value.isEmpty) {
      return 'User name cannot be empty';
    }
    if (value.length > 20) {
      return 'User name cannot be more than 20 characters';
    }
    return null;
  }

  static String? firstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'First name cannot be empty';
    }
    if (value.length > 20) {
      return 'First name cannot be more than 20 characters';
    }
    return null;
  }

  static String? lastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Last name cannot be empty';
    }
    if (value.length > 20) {
      return 'Last name cannot be more than 20 characters';
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    if (value.length > 20) {
      return 'Phone number cannot be more than 20 characters';
    }
    return null;
  }
}
