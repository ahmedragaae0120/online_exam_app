import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(onPressed: () {
        Navigator.pushNamed(context, AppStrings.examScreenRoute);
      }, icon: Icon(Icons.add)),
    );
  }
}
