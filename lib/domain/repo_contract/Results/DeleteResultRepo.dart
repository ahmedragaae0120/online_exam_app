import 'package:online_exam_app/domain/common/result.dart';

abstract class DeleteResultRepo {
  Future<Result<bool>> deleteResult(String id);
}
