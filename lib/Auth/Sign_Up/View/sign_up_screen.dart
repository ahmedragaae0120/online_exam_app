// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:online_exam_app/Auth/Login/View/login_screen.dart';
import 'package:online_exam_app/Auth/Sign_Up/View/widgets/sign_up_validator.dart';
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
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Form(
      key: SignUpValidator.formKey,
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
                  controller: SignUpValidator.userNameController,
                  validator: SignUpValidator().userNameValidate),
              Row(
                children: [
                  CustomTextField(
                    label: "first name",
                    placeholder: "Enter first name",
                    validator: SignUpValidator().firstNameValidate,
                    controller: SignUpValidator.firstNameController,
                  ),
                  CustomTextField(
                    label: "last name",
                    placeholder: "Enter last name",
                    controller: SignUpValidator.lastNameController,
                    validator: SignUpValidator().lasttNameValidate,
                  ),
                ],
              ),
              CustomTextField(
                label: "Email",
                placeholder: "Enter your email",
                controller: SignUpValidator.emailController,
                validator: SignUpValidator().emaillvalidate,
              ),
              Row(
                children: [
                  CustomPasswordField(
                    label: "Password",
                    controller: SignUpValidator.passwordController,
                    validator: SignUpValidator().passwordValidate,
                  ),
                  CustomPasswordField(
                    label: "Confirm Password",
                    controller: SignUpValidator.confirmPasswordController,
                    validator: SignUpValidator().confirmPasswordValidate,
                  ),
                ],
              ),
              CustomTextField(
                label: "Phone number",
                placeholder: "Enter phone number",
                controller: SignUpValidator.phoneNumberController,
                validator: SignUpValidator().phoneNumberValidate,
              ),
              CustomButton(
                  onTap: () {
                    if (SignUpValidator.formKey.currentState?.validate() ??
                        false) {
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
                      Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName);
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
