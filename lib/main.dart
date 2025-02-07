import 'package:flutter/material.dart';
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
      home: Homescreen(),
      routes: {
        '/Login': (context) => LoginScreen(),
        '/SignUp': (context) => SignUpScreen(),
        '/ProfileDetails': (context) => ProfileDetailsScreen(),
      },
    );
  }
}
