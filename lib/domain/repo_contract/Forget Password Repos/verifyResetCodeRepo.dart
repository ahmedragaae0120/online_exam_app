import 'package:online_exam_app/domain/common/result.dart';

abstract class VerifyresetcodeRepo {
  Future<Result<bool>> verifyResetCode({
    required String code,
  });
}
