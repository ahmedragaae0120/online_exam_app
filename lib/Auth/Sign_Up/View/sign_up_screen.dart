// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:online_exam_app/Shared/Validator.dart';
import 'package:online_exam_app/Shared/custom_button.dart';
import 'package:online_exam_app/Shared/custom_password_text_field.dart';
import 'package:online_exam_app/Shared/custom_text_field.dart';
import 'package:online_exam_app/config.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/sign_up_screen";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController phoneNumberController = TextEditingController();
  static TextEditingController userNameController = TextEditingController();
  static TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Form(
      key: _formKey,
      child: Scaffold(
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
                  label: "user name",
                  placeholder: "Enter your user name",
                  controller: userNameController,
                  validator: Validator.userName),
              Row(
                children: [
                  CustomTextField(
                    label: "first name",
                    placeholder: "Enter first name",
                    validator: Validator.firstName,
                    controller: firstNameController,
                  ),
                  CustomTextField(
                    label: "last name",
                    placeholder: "Enter last name",
                    controller: lastNameController,
                    validator: Validator.lastName,
                  ),
                ],
              ),
              CustomTextField(
                label: "Email",
                placeholder: "Enter your email",
                controller: emailController,
                validator: Validator.email,
              ),
              Row(
                children: [
                  CustomPasswordField(
                    label: "Password",
                    controller: passwordController,
                    validator: Validator.password,
                  ),
                  CustomPasswordField(
                    label: "Confirm Password",
                    controller: confirmPasswordController,
                    validator: (value) => Validator.confirmPassword(
                        value, passwordController.text),
                  ),
                ],
              ),
              CustomTextField(
                label: "Phone number",
                placeholder: "Enter phone number",
                controller: phoneNumberController,
                validator: Validator.phoneNumber,
              ),
              CustomButton(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      log("Sign Up Successful");
                    }
                  },
                  text: "Sign Up"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    child: Text("Login"),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/Login');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
