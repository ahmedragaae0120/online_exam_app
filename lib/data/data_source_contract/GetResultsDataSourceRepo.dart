import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';

abstract class GetResultsDataSourceRepo{
  Future<Result<List<ResultModel>>> fetchResults();
  Future<Result<bool>> addResult(ResultModel result);
  Future<Result<bool>> deleteResult(String id);
  Future<Result<ResultModel>> getResultById(String id);

}