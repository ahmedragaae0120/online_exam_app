// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:online_exam_app/Auth/Login/View/login_screen.dart';
import 'package:online_exam_app/Shared/custom_button.dart';
import 'package:online_exam_app/Shared/custom_text_field.dart';
import 'package:online_exam_app/config.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 24,
          children: [
            SizedBox(height: Config.screenHight! * 0.01),
            CustomTextField(
                label: "user name", placeholder: "Enter your user name"),
            Row(
              children: [
                CustomTextField(
                  label: "first name",
                  placeholder: "Enter first name",
                ),
                CustomTextField(
                  label: "last name",
                  placeholder: "Enter last name",
                ),
              ],
            ),
            Row(
              children: [
                CustomTextField(
                  label: "Password",
                  placeholder: "Enter Password",
                ),
                CustomTextField(
                  label: "Confirm Password",
                  placeholder: "Confirm Password",
                ),
              ],
            ),
            CustomTextField(
              label: "Phone number",
              placeholder: "Enter phone number",
            ),
            CustomButton(text: "Sign Up"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                  child: Text("Login"),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
