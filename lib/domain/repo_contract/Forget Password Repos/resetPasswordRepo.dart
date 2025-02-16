import 'package:online_exam_app/domain/common/result.dart';

abstract class ResetpasswordRepo {
  Future<Result<bool>> resetPassword({
    required String email,
    required String password,
  });
}
