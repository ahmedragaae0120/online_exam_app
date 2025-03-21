import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/Shared/observer/BlocObserver.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/my_app.dart';
import 'package:online_exam_app/ui/Auth/view_model/cubit/auth_cubit.dart';
import 'package:online_exam_app/ui/Auth/view_model/cubit/auth_intent.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();
  Bloc.observer = MyBlocObserver();
  final authCubit = getIt<AuthCubit>()..doIntent(CheckAuthIntent());
  runApp(BlocProvider<AuthCubit>(
    create: (context) => authCubit,
    child: EasyLocalization(
      supportedLocales: [
        Locale('ar'),
        Locale('en'),
      ],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale(
        'ar',
      ),
      startLocale: Locale('ar'),
      // assetLoader: CodegenLoader(),
      child: MyApp(),
    ),
  ));
}
