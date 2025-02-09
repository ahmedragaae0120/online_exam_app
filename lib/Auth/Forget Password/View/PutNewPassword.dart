import 'package:flutter/material.dart';
import 'package:online_exam_app/Shared/Validator.dart';
import 'package:online_exam_app/Shared/custom_button.dart';
import 'package:online_exam_app/Shared/custom_password_text_field.dart';
import 'package:online_exam_app/config.dart';

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
      print('Updating the password...');
      // Add logic to update the password
    }
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Password"),
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
                  "Reset password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '''
Password must not be empty and must contain
6 characters with an uppercase letter and one
number at least
''',
                  textAlign: TextAlign.center,
                ),
              ),
              /* Password Field */
              CustomPasswordField(
                label: 'New Password',
                controller: passwordController,
                validator: Validator.password,
              ),

              /* Confirm Password Field */
              CustomPasswordField(
                label: 'Confirm Password',
                controller: confirmPasswordController,
                validator: (value) => Validator.confirmPassword(value, passwordController.text),
              ),

              /* Continue Button */
              CustomButton(
                onTap: _validateAndUpdatePassword,
                text: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
