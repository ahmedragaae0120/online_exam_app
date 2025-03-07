// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/ui/Profile_Details/profile_details_screen.dart';
import 'package:online_exam_app/Shared/widgets/custom_bottom_navigation_bar.dart';
import 'package:online_exam_app/ui/Profile_Details/viewmodel/cubit/profile_cubit.dart';
import 'package:online_exam_app/ui/explorescreen/explore_screen.dart';
import 'resultsScreen/VeiwModel/result_cubit.dart';
import 'resultsScreen/pages/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ExploreScreen(),
    BlocProvider(
      create: (context) => getIt<ResultCubit>(), // Wrap the ResultScreen
      child: ResultScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<ProfileCubit>(),
      child: ProfileDetailsScreen(),
    ),
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
