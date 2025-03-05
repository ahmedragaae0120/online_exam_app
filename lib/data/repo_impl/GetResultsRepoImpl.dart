import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/GetResultsDataSourceRepo.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/GetResultsRepo.dart';

@Injectable(as: GetResultsRepo)
class GetResultsRepoImpl implements GetResultsRepo {
  GetResultsDataSourceRepo repo;

  GetResultsRepoImpl(this.repo);

  @override
  Future<Result<List<ResultModel>>> FetchResults() {
    return repo.fetchResults();
  }

  @override
  Future<Result<ResultModel>> getResultById(String id) {
    return repo.getResultById(id);
  }

  @override
  Future<Result<bool>> addResult(ResultModel result) {
    return repo.addResult(result);
  }

  @override
  Future<Result<bool>> deleteResult(String id) {
    return repo.deleteResult(id);
  }
}
