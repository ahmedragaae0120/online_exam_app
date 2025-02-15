import 'package:online_exam_app/data/model/user_response/user_response.dart';

sealed class AuthIntent {}

class SignUpIntent extends AuthIntent {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  SignUpIntent(
      {required this.username,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.phone});
}

class LoginIntent extends AuthIntent {
  LoginIntent();
}
