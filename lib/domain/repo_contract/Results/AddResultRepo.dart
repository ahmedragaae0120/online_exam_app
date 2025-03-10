import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';

abstract class AddResultRepo {
  Future<Result<bool>> addResult(ResultModel result);
}
