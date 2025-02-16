import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/Shared/observer/BlocObserver.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/api/api_manager.dart';

import 'package:online_exam_app/core/theme/Theme%20app.dart';
import 'package:online_exam_app/ui/Auth/view_model/cubit/auth_cubit.dart';
import 'package:online_exam_app/ui/Auth/Forget%20Password/EmailVerifecation.dart';
import 'package:online_exam_app/ui/Auth/Forget%20Password/EnterEmailForPasswordReset.dart';
import 'package:online_exam_app/ui/Auth/Forget%20Password/PutNewPassword.dart';
import 'package:online_exam_app/ui/Auth/Login/login_screen.dart';
import 'package:online_exam_app/ui/Auth/Sign_Up/sign_up_screen.dart';
import 'package:online_exam_app/ui/home_screen.dart';
import 'package:online_exam_app/ui/Profile_Details/profile_details_screen.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';

void main() {
  ApiManager.init();
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.LightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        AppStrings.homeScreenRoute: (context) => HomeScreen(),
        AppStrings.loginScreenRoute: (context) => LoginScreen(),
        AppStrings.singUpScreenRoute: (context) => BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: SignUpScreen(),
            ),
        AppStrings.profileDetailsScreenRoute: (context) =>
            ProfileDetailsScreen(),
        AppStrings.enterEmailForgetPasswordScreenRoute: (context) =>
            EnterEmailForgetPassword(),
        AppStrings.emailVerificationScreenRoute: (context) =>
            EmailVerification(),
        AppStrings.putNewPasswordScreenRoute: (context) => PutNewPassword(),
      },
      initialRoute: AppStrings.loginScreenRoute,
    );
  }
}
