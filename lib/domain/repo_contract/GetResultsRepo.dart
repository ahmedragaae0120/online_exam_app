import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';

abstract class GetResultsRepo {
  Future<Result<List<ResultModel>>> FetchResults();
  Future<Result<ResultModel>> getResultById(String id);
  Future<Result<bool>> addResult(ResultModel result);
  Future<Result<bool>> deleteResult(String id);
}