import 'package:online_exam_app/domain/common/result.dart';

abstract class DeleteResultDataSourceRepo {
  Future<Result<bool>> deleteResult(String id);
}
