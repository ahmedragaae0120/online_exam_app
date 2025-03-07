import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/Shared/observer/BlocObserver.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/services/token_storage_service.dart';
import 'package:online_exam_app/my_app.dart';
import 'package:online_exam_app/ui/Auth/view_model/cubit/auth_cubit.dart';

import 'package:online_exam_app/ui/Auth/Forget%20Password/EmailVerifecation.dart';
import 'package:online_exam_app/ui/Auth/Forget%20Password/EnterEmailForPasswordReset.dart';
import 'package:online_exam_app/ui/Auth/Forget%20Password/PutNewPassword.dart';
import 'package:online_exam_app/ui/Auth/Login/login_screen.dart';
import 'package:online_exam_app/ui/Auth/Sign_Up/sign_up_screen.dart';
import 'package:online_exam_app/ui/Profile_Details/change_password/change_password_screen.dart';
import 'package:online_exam_app/ui/home_screen.dart';
import 'package:online_exam_app/ui/Profile_Details/profile_details_screen.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  Bloc.observer = MyBlocObserver();
  final tokenStorage = getIt<TokenStorageService>();
  final token = await tokenStorage.getToken();

  runApp(BlocProvider<AuthCubit>(
    create: (context) => getIt<AuthCubit>(),
    child: MyApp(initialToken: token),
  ));
}
