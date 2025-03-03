import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';

abstract class GetResultsDataSourceRepo{
  Future<Result<List<ResultModel>>> FetchResults(String userId);
  Future<Result<bool>> addResult(String userId,ResultModel result);
  Future<Result<bool>> deleteResult(String userId, String id);

}