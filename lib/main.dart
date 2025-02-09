import 'package:flutter/material.dart';
import 'package:online_exam_app/Auth/Forget%20Password/View/EmailVerifecation.dart';
import 'package:online_exam_app/Auth/Forget%20Password/View/EnterEmailForPasswordReset.dart';
import 'package:online_exam_app/Auth/Forget%20Password/View/PutNewPassword.dart';
import 'package:online_exam_app/Auth/Forget%20Password/View/forget_password_screen.dart';
import 'package:online_exam_app/Auth/Login/View/login_screen.dart';
import 'package:online_exam_app/Auth/Sign_Up/View/sign_up_screen.dart';
import 'package:online_exam_app/home_screen.dart';
import 'package:online_exam_app/Profile_Details/View/profile_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Homescreen.routeName: (context) => Homescreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        ProfileDetailsScreen.routeName: (context) => ProfileDetailsScreen(),
        ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
        EnterEmailForgetPassword.routeName: (context) =>
            EnterEmailForgetPassword(),
        EmailVerification.routeName: (context) => EmailVerification(),
        PutNewPassword.routeName: (context) => PutNewPassword(),
      },
      initialRoute: Homescreen.routeName,
    );
  }
}
