import 'package:online_exam_app/domain/common/result.dart';

abstract class ChangePasswordDataSourceContract {
  Future<Result<void>> changePassword({
    required String oldPassword,
    required String password,
    required String rePassword,
  });
}
