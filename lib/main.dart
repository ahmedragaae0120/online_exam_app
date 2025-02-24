import 'package:flutter/material.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await configureDependencies(); // This will initialize ApiManager through DI
  runApp(MyApp());
}
