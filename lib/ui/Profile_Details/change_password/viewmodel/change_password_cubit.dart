import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/use_cases/change_password_usecase.dart';
import 'package:online_exam_app/ui/Profile_Details/change_password/viewmodel/change_password_intent.dart';
import 'package:online_exam_app/ui/Profile_Details/change_password/viewmodel/change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUsecase changePasswordUsecase;

  ChangePasswordCubit(this.changePasswordUsecase)
      : super(ChangePasswordInitialState());

  void doIntent(ChangePasswordIntent intent) async {
    if (intent is UpdatePasswordIntent) {
      await _handleUpdatePassword(intent);
    }
  }

  Future<void> _handleUpdatePassword(UpdatePasswordIntent intent) async {
    try {
      emit(ChangePasswordLoadingState());
      await changePasswordUsecase.invoke(
        oldPassword: intent.currentPassword,
        password: intent.newPassword,
        rePassword: intent.confirmPassword,
      );
      emit(ChangePasswordSuccessState());
    } catch (e) {
      emit(ChangePasswordErrorState(e.toString()));
    }
  }
}
