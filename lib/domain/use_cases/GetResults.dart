import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/GetResultsRepo.dart';
@injectable
class GetResultsUseCase {
  GetResultsRepo repo;

  GetResultsUseCase(this.repo);

  Future<Result<List<ResultModel>>> fetchResults() async {
    return repo.FetchResults();
  }

  Future<Result<bool>> addResult(ResultModel result) async {
    return repo.addResult(result);
  }
}
