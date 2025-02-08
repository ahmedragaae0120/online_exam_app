import 'package:flutter/material.dart';
import 'package:online_exam_app/Shared/custom_button.dart';
import 'package:online_exam_app/Shared/custom_password_text_field.dart';
import 'package:online_exam_app/Shared/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            /* -------------------------------------------------------------------------- */
            /*                                 Email Field                                */
            /* -------------------------------------------------------------------------- */
            CustomTextField(
              label: 'Email',
              placeholder: 'Enter your email',
            ),
            /* -------------------------------------------------------------------------- */
            SizedBox(height: 30),

            /* -------------------------------------------------------------------------- */
            /*                                Password Field                              */
            /* -------------------------------------------------------------------------- */
            CustomPasswordField(label: 'Password'),
            /* -------------------------------------------------------------------------- */
            SizedBox(height: 20),

            /* -------------------------------------------------------------------------- */
            /*                         Remember Me & Forget Password                     */
            /* -------------------------------------------------------------------------- */
            Row(
              children: [
                /* ------------------------------ Remember Me ------------------------------ */
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

                /* ---------------------------- Forget Password ---------------------------- */

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      print("Forget password Button Pressed");
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
            /* -------------------------------------------------------------------------- */
            SizedBox(height: 30),

            /* -------------------------------------------------------------------------- */
            /*                                  Login Button                              */
            /* -------------------------------------------------------------------------- */
            CustomButton(text: 'Login'),
            /* -------------------------------------------------------------------------- */
            SizedBox(height: 20),

            /* -------------------------------------------------------------------------- */
            /*                               Sign Up Option                               */
            /* -------------------------------------------------------------------------- */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: GestureDetector(
                    onTap: () {
                      /// Navigating to Sign Up page
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
            /* -------------------------------------------------------------------------- */
          ],
        ),
      ),
    );
  }
}
