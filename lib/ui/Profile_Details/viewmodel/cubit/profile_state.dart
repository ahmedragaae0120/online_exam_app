import 'package:online_exam_app/data/model/profile_response.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';

sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLogoutState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final UserResponse profileResponse;
  ProfileLoadedState({required this.profileResponse});
}

class ProfileErrorState extends ProfileState {
  final String message;
  ProfileErrorState({required this.message});
}

class ProfileUpdateLoadingState extends ProfileState {}

class ProfileUpdateSuccessState extends ProfileState {
  final UserResponse profileResponse;
  ProfileUpdateSuccessState({required this.profileResponse});
}

class ProfileUpdateErrorState extends ProfileState {
  final String message;
  ProfileUpdateErrorState({required this.message});
}
