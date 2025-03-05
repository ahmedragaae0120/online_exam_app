import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/services/user_service.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/GetResultsRepo.dart';
@injectable
class GetResultsUseCase {
  GetResultsRepo repo;
  @factoryMethod
  GetResultsUseCase(this.repo,);



  Future<Result<List<ResultModel>>> fetchResults() async {
    return repo.FetchResults();
  }

  Future<Result<ResultModel>> getResultById({required String examId}) async {
    return repo.getResultById(examId);
  }

  Future<Result<bool>> addResult(ResultModel result) async {
    return repo.addResult(result);
  }

  Future<Result<bool>> deleteResult({required String id}) async {
    return repo.deleteResult(id);
  }
}
