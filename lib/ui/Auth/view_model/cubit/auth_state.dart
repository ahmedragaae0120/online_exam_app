part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignupSuccessState extends AuthState {
  UserResponse? userResponse;
  SignupSuccessState({required this.userResponse});
}

final class SignupLoadingState extends AuthState {}

final class SignupErrorState extends AuthState {
  String? message;
  SignupErrorState({required this.message});
}

final class LoginSuccessState extends AuthState {
  LoginSuccessState();
}

final class LoginLoadingState extends AuthState {}

final class LoginErrorState extends AuthState {
  String? message;
  LoginErrorState({required this.message});
}
