import 'package:online_exam_app/domain/common/result.dart';

abstract class ChangePasswordRepoContract {
  Future<Result<void>> changePassword({
    required String oldPassword,
    required String password,
    required String rePassword,
  });
}
