import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/Shared/observer/BlocObserver.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/services/token_storage_service.dart';
import 'package:online_exam_app/my_app.dart';
import 'package:online_exam_app/ui/Auth/view_model/cubit/auth_cubit.dart';

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
