
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/GetResultsDataSourceRepo.dart';
import 'package:online_exam_app/data/model/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/GetResultsRepo.dart';
@Injectable(as: GetResultsRepo)
class  GetResultsRepoImpl implements GetResultsRepo{

  GetResultsDataSourceRepo repo;
  GetResultsRepoImpl(this.repo);

  @override
  Future<Result<List<ResultModel>>> FetchResults(String userId) {
    return repo.FetchResults(userId);
  }

  @override
  Future<Result<bool>> addResult(String userId,ResultModel result) {
    return repo.addResult(userId,result);
  }
}