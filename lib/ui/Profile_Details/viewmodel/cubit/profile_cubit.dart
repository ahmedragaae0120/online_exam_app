import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/services/token_storage_service.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/use_cases/profile_usecases.dart';
import 'package:online_exam_app/ui/Profile_Details/viewmodel/cubit/profile_state.dart';
import 'profile_intent.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final TokenStorageService tokenStorage;

  ProfileCubit({
    required this.getProfileUseCase,
    required this.updateProfileUseCase,
    required this.tokenStorage,
  }) : super(ProfileInitial());

  Future<void> getProfileData() async {
    emit(ProfileLoadingState());
    final result = await getProfileUseCase.invoke();

    switch (result) {
      case Success():
        emit(
            ProfileLoadedState(profileResponse: result.data ?? UserResponse()));
      case Error():
        emit(ProfileErrorState(message: result.exception.toString()));
    }
  }

  Future<void> updateProfile({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    String? password,
  }) async {
    emit(ProfileUpdateLoadingState());
    final result = await updateProfileUseCase.invoke(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      password: password,
    );

    switch (result) {
      case Success():
        emit(ProfileUpdateSuccessState(
            profileResponse: result.data ?? UserResponse()));
      case Error():
        emit(ProfileUpdateErrorState(message: result.exception.toString()));
    }
  }

  Future<void> logout() async {
    // Clear the stored token
    await tokenStorage.clearToken(); // Updated this line
    emit(ProfileLogoutState());
  }

  void doIntent(ProfileIntent intent) {
    switch (intent) {
      case GetProfileIntent():
        getProfileData();
        break;
      case UpdateProfileIntent():
        updateProfile(
          username: intent.username,
          firstName: intent.firstName,
          lastName: intent.lastName,
          email: intent.email,
          phone: intent.phone,
          password: intent.password,
        );
        break;
      case LogoutIntent():
        logout();
        break;
    }
  }
}
