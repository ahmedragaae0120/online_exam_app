import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/use_cases/signup_usecase.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signupUsecase) : super(SignupInitial());
  @factoryMethod
  SignupUsecase signupUsecase;

  // void doIntent({
  //   required SignUpIntent signUpIntent,
  //   required String username,
  //   required String firstName,
  //   required String lastName,
  //   required String email,
  //   required String password,
  //   required String confirmPassword,
  //   required String phone,
  // }) {
  //   signUpIntent.userResponse
  //   _SignUp(
  //       username: username,
  //       firstName: firstName,
  //       lastName: lastName,
  //       email: email,
  //       password: password,
  //       confirmPassword: confirmPassword,
  //       phone: phone);
  // }

  static SignupCubit get(BuildContext context) => BlocProvider.of(context);

  SignUp({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
  }) async {
    emit(SignupLoadingState());
    final result = await signupUsecase.invoke(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone);

    switch (result) {
      case Success():
        {
          emit(SignupSuccessState(userResponse: result.data));
        }
      case Error():
        {
          emit(SignupErrorState(message: result.exception.toString()));
        }
    }
  }
}
