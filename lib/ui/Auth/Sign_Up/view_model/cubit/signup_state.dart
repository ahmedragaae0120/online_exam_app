part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupSuccessState extends SignupState {
  UserResponse? userResponse;
  SignupSuccessState({required this.userResponse});
}

final class SignupLoadingState extends SignupState {}

final class SignupErrorState extends SignupState {
  String? message;
  SignupErrorState({required this.message});
}
