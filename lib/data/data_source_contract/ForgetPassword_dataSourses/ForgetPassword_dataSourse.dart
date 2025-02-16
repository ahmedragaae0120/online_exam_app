import 'package:online_exam_app/domain/common/result.dart';

abstract class ForgetpasswordDataSourseRepo {

  Future<Result<bool>> SendEmailVerification({
    required String email,
  });
}
