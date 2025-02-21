import 'package:online_exam_app/data/model/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';

abstract class GetResultsRepo {
  Future<Result<List<ResultModel>>> FetchResults(String userId);
  Future<Result<bool>> addResult(String userId,ResultModel result);
}