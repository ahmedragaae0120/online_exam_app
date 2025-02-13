import 'package:flutter/material.dart';
import 'package:online_exam_app/features/Auth/presentation/pages/Forget%20Password/EnterEmailForPasswordReset.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const routeName = '/ForgetPasswordScreen';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EnterEmailForgetPassword();
  }
}
