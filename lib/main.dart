import 'package:flutter/material.dart';
import 'package:online_exam_app/features/Auth/presentation/pages/Forget%20Password/EmailVerifecation.dart';
import 'package:online_exam_app/features/Auth/presentation/pages/Forget%20Password/PutNewPassword.dart';
import 'package:online_exam_app/features/Auth/presentation/pages/Forget%20Password/EnterEmailForPasswordReset.dart';
import 'package:online_exam_app/features/Auth/presentation/pages/login_screen.dart';
import 'package:online_exam_app/features/Auth/presentation/pages/sign_up_screen.dart';
import 'package:online_exam_app/core/theme/Theme%20app.dart';
import 'package:online_exam_app/home_screen.dart';
import 'package:online_exam_app/features/Profile_Details/presentation/profile_details_screen.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';

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
