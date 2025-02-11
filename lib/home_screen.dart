// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:online_exam_app/Profile_Details/View/profile_details_screen.dart';
import 'package:online_exam_app/Shared/custom_bottom_navigation_bar.dart';
import 'package:online_exam_app/explorescreen/view/explore_screen.dart';
import 'package:online_exam_app/resultscreen/view/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ExploreScreen(), // Replace with your actual screen widget
    ResultScreen(),
    ProfileDetailsScreen(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabSelected,
      ),
    );
  }
}
