import 'package:online_exam_app/domain/common/result.dart';

abstract class VerifyresetcodeRepoDataSource {
  Future<Result<bool>> verifyResetCode({
    required String code,
  });
}
