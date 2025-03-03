import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/Shared/observer/BlocObserver.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/services/token_storage_service.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';
import 'package:online_exam_app/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  final prefs = await SharedPreferences.getInstance();

  final tokenStorage = TokenStorageService(prefs);

  final initialRoute = tokenStorage.getToken() != null
      ? AppStrings.homeScreenRoute
      : AppStrings.loginScreenRoute;

  await configureDependencies();
  runApp(MyApp(
    initialToken: initialRoute,
  ));
}
