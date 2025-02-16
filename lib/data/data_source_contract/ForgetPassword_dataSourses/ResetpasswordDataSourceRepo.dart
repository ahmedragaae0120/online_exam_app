// ignore_for_file: file_names

import 'package:online_exam_app/domain/common/result.dart';

abstract class ResetpasswordDataSourceRepo {
  Future<Result<bool>> resetPassword({
    required String email,
    required String password,
  });
}
