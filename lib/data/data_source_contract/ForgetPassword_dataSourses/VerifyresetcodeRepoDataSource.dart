// ignore_for_file: file_names

import 'package:online_exam_app/domain/common/result.dart';

abstract class VerifyresetcodeRepoDataSource {
  Future<Result<bool>> verifyResetCode({
    required String code,
  });
}
