// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:online_exam_app/Shared/widgets/Validator.dart';
import 'package:online_exam_app/Shared/widgets/custom_button.dart';
import 'package:online_exam_app/Shared/widgets/custom_password_text_field.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';

class PutNewPassword extends StatefulWidget {
  static const routeName = '/PutNewPassword';
  const PutNewPassword({super.key});

  @override
  State<PutNewPassword> createState() => _PutNewPasswordState();
}

class _PutNewPasswordState extends State<PutNewPassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _validateAndUpdatePassword() {
    if (_formKey.currentState!.validate()) {
      // Add logic to update the password
    }
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.password),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 24,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  AppStrings.resetPassword,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  AppStrings.passwordvalid,
                  textAlign: TextAlign.center,
                ),
              ),
              /* Password Field */
              CustomPasswordField(
                label: AppStrings.continu,
                controller: passwordController,
                validator: Validator.password,
              ),

              /* Confirm Password Field */
              CustomPasswordField(
                label: AppStrings.confirmPassword,
                controller: confirmPasswordController,
                validator: (value) =>
                    Validator.confirmPassword(value, passwordController.text),
              ),

              /* Continue Button */
              CustomButton(
                onTap: _validateAndUpdatePassword,
                text: AppStrings.continu,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
