import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/exceptions/server_error.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/use_cases/signup_usecase.dart';
import 'package:online_exam_app/ui/Auth/view_model/cubit/auth_intent.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.signupUsecase) : super(AuthInitial());
  @factoryMethod
  SignupUsecase signupUsecase;

  void doIntent(AuthIntent intent) {
    switch (intent) {
      case SignUpIntent():
        _SignUp(intent: intent);
        break;
      case LoginIntent():
        _login();
        break;
    }
  }

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  _SignUp({required SignUpIntent intent}) async {
    emit(SignupLoadingState());
    final result = await signupUsecase.invoke(
        username: intent.username,
        firstName: intent.firstName,
        lastName: intent.lastName,
        email: intent.email,
        password: intent.password,
        confirmPassword: intent.confirmPassword,
        phone: intent.phone);

    switch (result) {
      case Success():
        {
          emit(SignupSuccessState(userResponse: result.data));
        }
      case Error():
        {
          if (result.exception is ClientError) {
            emit(SignupErrorState(
                message: (result.exception as ClientError).message ??
                    "Unknown error"));
          } else {
            emit(SignupErrorState(message: result.exception.toString()));
          }
        }
    }
  }

  _login() {}
}
