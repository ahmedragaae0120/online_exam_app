import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/Shared/observer/BlocObserver.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await configureDependencies(); // This will initialize ApiManager through DI
  runApp(MyApp());
}
