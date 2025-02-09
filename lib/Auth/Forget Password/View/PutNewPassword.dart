import 'package:flutter/material.dart';
import 'package:online_exam_app/Shared/custom_button.dart';
import 'package:online_exam_app/Shared/custom_password_text_field.dart';
import 'package:online_exam_app/config.dart';

class PutNewPassword extends StatefulWidget {
  const PutNewPassword({super.key});

  @override
  State<PutNewPassword> createState() => _PutNewPasswordState();
}

class _PutNewPasswordState extends State<PutNewPassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _validateAndUpdatePassword() {
    if (_formKey.currentState!.validate()) {
      print('Updating the password...');
      // Add logic to update the password
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    if (!RegExp(r'^(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
      return "Password must contain at least one uppercase letter and one number";
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: Config.screenHight! * 0.03),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Reset password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: Config.screenHight! * 0.012),
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
              SizedBox(height: Config.screenHight! * 0.06),

              /* Password Field */
              CustomPasswordField(
                label: 'New Password',
                controller: passwordController,
                validator: _validatePassword,
              ),
              SizedBox(height: Config.screenHight! * 0.02),

              /* Confirm Password Field */
              CustomPasswordField(
                label: 'Confirm Password',
                controller: confirmPasswordController,
                validator: _validateConfirmPassword,
              ),
              SizedBox(height: Config.screenHight! * 0.06),

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
