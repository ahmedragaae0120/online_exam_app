// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:online_exam_app/Auth/Login/View/login_screen.dart';
import 'package:online_exam_app/Auth/Sign_Up/View/sign_up_screen.dart';
import 'package:online_exam_app/Profile_Details/View/profile_details_screen.dart';
import 'package:online_exam_app/Shared/custom_bottom_navigation_bar.dart';

class Homescreen extends StatefulWidget {
  static const String routeName = '/Homescreen';
  const Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0; // Track the currently selected tab

  final List<Widget> _screens = [
    LoginScreen(),
    SignUpScreen(),
    ProfileDetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex, // Show the selected screen
        children: _screens, // Keep all screens in memory
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _currentIndex,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });
        },
      ),
    );
  }
}
