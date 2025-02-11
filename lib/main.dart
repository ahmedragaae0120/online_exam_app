import 'package:flutter/material.dart';
import 'package:online_exam_app/Auth/Forget%20Password/View/EmailVerifecation.dart';
import 'package:online_exam_app/Auth/Forget%20Password/View/PutNewPassword.dart';
import 'package:online_exam_app/Auth/Forget%20Password/View/EnterEmailForPasswordReset.dart';
import 'package:online_exam_app/Auth/Login/View/login_screen.dart';
import 'package:online_exam_app/Auth/Sign_Up/View/sign_up_screen.dart';
import 'package:online_exam_app/Theme%20app/Theme%20app.dart';
import 'package:online_exam_app/home_screen.dart';
import 'package:online_exam_app/Profile_Details/View/profile_details_screen.dart';
import 'package:online_exam_app/utils/string_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: MyThemeData.LightTheme,

      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        AppStrings.homeScreenRoute: (context) => HomeScreen(),
        AppStrings.loginScreenRoute: (context) => LoginScreen(),
        AppStrings.singUpScreenRoute: (context) => SignUpScreen(),
        AppStrings.profileDetailsScreenRoute: (context) =>
            ProfileDetailsScreen(),
        AppStrings.enterEmailForgetPasswordScreenRoute: (context) =>
            EnterEmailForgetPassword(),
        AppStrings.emailVerificationScreenRoute: (context) =>
            EmailVerification(),
        AppStrings.putNewPasswordScreenRoute: (context) => PutNewPassword(),
      },
    );
  }
}
