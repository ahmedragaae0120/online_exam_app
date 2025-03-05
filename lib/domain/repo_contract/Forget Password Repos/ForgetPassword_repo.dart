import 'package:online_exam_app/domain/common/result.dart';

abstract class ForgetpasswordRepo {
  Future<Result<bool>> SendEmailVerification({
    required String email,
  });
}
