import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/change_password_datasource.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/change_password_repo_contract.dart';

@Injectable(as: ChangePasswordRepoContract)
class ChangePasswordRepoImpl implements ChangePasswordRepoContract {
  ChangePasswordDataSourceContract changePasswordDataSourceContract;

  @factoryMethod
  ChangePasswordRepoImpl({required this.changePasswordDataSourceContract});

  @override
  Future<Result<void>> changePassword({
    required String oldPassword,
    required String password,
    required String rePassword,
  }) async {
    return await changePasswordDataSourceContract.changePassword(
      oldPassword: oldPassword,
      password: password,
      rePassword: rePassword,
    );
  }
}
