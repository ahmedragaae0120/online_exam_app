abstract class ChangePasswordState {}

class ChangePasswordInitialState extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {}

class ChangePasswordErrorState extends ChangePasswordState {
  final String message;
  ChangePasswordErrorState(this.message);
}
