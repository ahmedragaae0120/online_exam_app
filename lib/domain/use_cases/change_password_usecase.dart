import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/change_password_repo_contract.dart';

@injectable
class ChangePasswordUsecase {
  final ChangePasswordRepoContract changePasswordRepoContract;

  @factoryMethod
  ChangePasswordUsecase({
    required this.changePasswordRepoContract,
  });

  Future<Result<void>> invoke({
    required String oldPassword,
    required String password,
    required String rePassword,
  }) async {
    final result = await changePasswordRepoContract.changePassword(
      oldPassword: oldPassword,
      password: password,
      rePassword: rePassword,
    );

    return result;
  }
}
