import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/theme/Theme%20app.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';
import 'package:online_exam_app/ui/Auth/Forget%20Password/EmailVerifecation.dart';
import 'package:online_exam_app/ui/Auth/Forget%20Password/EnterEmailForPasswordReset.dart';
import 'package:online_exam_app/ui/Auth/Forget%20Password/PutNewPassword.dart';
import 'package:online_exam_app/ui/Auth/Login/login_screen.dart';
import 'package:online_exam_app/ui/Auth/Sign_Up/sign_up_screen.dart';
import 'package:online_exam_app/ui/Auth/view_model/cubit/auth_cubit.dart';
import 'package:online_exam_app/ui/Profile_Details/change_password/change_password_screen.dart';
import 'package:online_exam_app/ui/Profile_Details/profile_details_screen.dart';
import 'package:online_exam_app/ui/exam_screen/view/exam_screen.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_cubit.dart';
import 'package:online_exam_app/ui/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.LightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        AppStrings.homeScreenRoute: (context) => HomeScreen(),
        AppStrings.loginScreenRoute: (context) => BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: SignInScreen(),
            ),
        AppStrings.singUpScreenRoute: (context) => BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: SignUpScreen(),
            ),
        AppStrings.enterEmailForgetPasswordScreenRoute: (context) =>
            BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: EnterEmailForgetPassword(),
            ),
        AppStrings.emailVerificationScreenRoute: (context) => BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: EmailVerification(),
            ),
        AppStrings.putNewPasswordScreenRoute: (context) => BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: PutNewPassword(),
            ),
        AppStrings.examScreenRoute: (context) => BlocProvider(
              create: (context) => getIt<QuestionsCubit>(),
              child: ExamScreen(),
            ),
        // In the routes map, update the profile route:
        AppStrings.profileDetailsScreenRoute: (context) =>
            ProfileDetailsScreen(),
        AppStrings.changePasswordScreenRoute: (context) =>
            const ChangePasswordScreen(),
      },
      initialRoute: AuthCubit.get(context).startRoute,
    );
  }
}
