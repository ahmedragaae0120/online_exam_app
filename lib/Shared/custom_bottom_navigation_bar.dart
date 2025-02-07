// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onTabChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: GNav(
        selectedIndex: selectedIndex, // Highlight the selected tab
        onTabChange: onTabChange, // Notify parent when tab changes
        rippleColor: Colors.grey.shade700,
        hoverColor: Colors.grey.shade700,
        haptic: true,
        tabBorderRadius: 15,
        tabActiveBorder: Border.all(color: Colors.black, width: 1),
        tabBorder: Border.all(color: Colors.grey, width: 1),
        tabShadow: [BoxShadow(color: Colors.grey.shade500, blurRadius: 8)],
        curve: Curves.easeOutExpo,
        duration: Duration(milliseconds: 50),
        gap: 8,
        color: Colors.grey[800],
        activeColor: Colors.purple,
        iconSize: 24,
        tabBackgroundColor: Colors.grey.shade400,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tabs: [
          GButton(icon: Icons.login, text: 'Login'),
          GButton(icon: Icons.app_registration, text: 'Sign Up'),
          GButton(icon: Icons.account_circle, text: 'Profile Details'),
        ],
      ),
    );
  }
}
