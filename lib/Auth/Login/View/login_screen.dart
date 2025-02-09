import 'package:flutter/material.dart';
import 'package:online_exam_app/Shared/custom_button.dart';
import 'package:online_exam_app/Shared/custom_password_text_field.dart';
import 'package:online_exam_app/Shared/custom_text_field.dart';
import 'package:online_exam_app/config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _validateAndLogin() {
    if (_formKey.currentState!.validate()) {
      print("Login Successful");
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty";
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? _validatePassword(String? value) {
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

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: Config.screenHight! * 0.01),

              /* Email Field */
              CustomTextField(
                label: 'Email',
                placeholder: 'Enter your email',
                controller: emailController,
                validator: _validateEmail,
              ),
              SizedBox(height: 30),

              /* Password Field */
              CustomPasswordField(
                label: 'Password',
                controller: passwordController,
                validator: _validatePassword,
              ),
              SizedBox(height: 20),

              /* Remember Me & Forget Password */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: Color(0xff02369C),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      "Remember me",
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/EnterEmailForgetPassword');
                        },
                        child: Text(
                          "Forget password?",
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.black,
                            decorationThickness: 2,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              /* Login Button */
              CustomButton(onTap: _validateAndLogin, text: 'Login'),
              SizedBox(height: 20),

              /* Sign Up Option */
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: GestureDetector(
                      onTap: () {
                        print("Sign Up Button Pressed");
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blueAccent,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
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
