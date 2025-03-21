import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';

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
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTabChange,
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF02369C),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: [
        _buildNavItem(Icons.home_outlined, AppStrings.explore, 0),
        _buildNavItem(Icons.edit_note_outlined, AppStrings.result, 1),
        _buildNavItem(Icons.person_outline, AppStrings.profile, 2),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(
      IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          if (isSelected)
            Container(
              width: 40,
              height: 32,
              decoration: BoxDecoration(
                color: Color(0xFF02369C).withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          Icon(icon, color: isSelected ? Color(0xFF02369C) : Colors.grey),
        ],
      ),
      label: label,
    );
  }
}
