import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/theme/Theme%20app.dart';
import 'package:online_exam_app/core/utils/app_routes.dart';
import 'package:online_exam_app/ui/Auth/Forget%20Password/EmailVerifecation.dart';
import 'package:online_exam_app/ui/Auth/Forget%20Password/EnterEmailForPasswordReset.dart';
import 'package:online_exam_app/ui/Auth/Forget%20Password/PutNewPassword.dart';
import 'package:online_exam_app/ui/Auth/Login/login_screen.dart';
import 'package:online_exam_app/ui/Auth/Sign_Up/sign_up_screen.dart';
import 'package:online_exam_app/ui/Auth/view_model/cubit/auth_cubit.dart';
import 'package:online_exam_app/ui/Profile_Details/change_password/change_password_screen.dart';
import 'package:online_exam_app/ui/Profile_Details/profile_details_screen.dart';
import 'package:online_exam_app/ui/all_exams_on_subject/all_exams_on_subject_screen.dart';
import 'package:online_exam_app/ui/all_exams_on_subject/viewmodel/get_all_exams_on_subject_cubit.dart';
import 'package:online_exam_app/ui/all_exams_on_subject/viewmodel/get_all_exams_on_subject_intent.dart';
import 'package:online_exam_app/ui/explorescreen/explore_screen.dart';
import 'package:online_exam_app/ui/explorescreen/viewmodel/cubit/explore_cubit.dart';
import 'package:online_exam_app/ui/explorescreen/viewmodel/cubit/explore_intent.dart';
import 'package:online_exam_app/ui/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale, // ✅ اجعل التطبيق يستخدم اللغة المختارة
      supportedLocales: context.supportedLocales, // ✅ تأكد من اللغات المدعومة
      localizationsDelegates: context.localizationDelegates,
      theme: MyThemeData.LightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.homeScreenRoute: (context) => HomeScreen(),
        AppRoutes.loginScreenRoute: (context) => BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: SignInScreen(),
            ),
        AppRoutes.singUpScreenRoute: (context) => BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: SignUpScreen(),
            ),
        AppRoutes.enterEmailForgetPasswordScreenRoute: (context) =>
            BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: EnterEmailForgetPassword(),
            ),
        AppRoutes.emailVerificationScreenRoute: (context) => BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: EmailVerification(),
            ),
        AppRoutes.putNewPasswordScreenRoute: (context) => BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: PutNewPassword(),
            ),
        // AppRoutes.examScreenRoute: (context) => BlocProvider(
        //       create: (context) => getIt<QuestionsCubit>(),
        //       child: ExamScreen(),
        //     ),
        // In the routes map, update the profile route:
        AppRoutes.profileDetailsScreenRoute: (context) =>
            ProfileDetailsScreen(),
        AppRoutes.changePasswordScreenRoute: (context) =>
            const ChangePasswordScreen(),
        AppRoutes.exploreScreenRoute: (context) => BlocProvider(
              create: (context) =>
                  getIt<ExploreCubit>()..doIntent(GetSubjectsIntent()),
              child: const ExploreScreen(),
            ),
        AppRoutes.getAllExamsOnSubjectScreenRoute: (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return BlocProvider(
            create: (context) => getIt<AllExamsCubit>()
              ..doIntent(GetAllExamsOnSubjectIntent(args['subjectId']!)),
            child: AllExamsOnSubjectScreen(
              subjectId: args['subjectId']!,
              subjectName: args['subjectName']!,
            ),
          );
        },
      },
      initialRoute: AuthCubit.get(context).startRoute,
    );
  }
}
