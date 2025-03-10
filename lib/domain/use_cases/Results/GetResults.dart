import 'package:injectable/injectable.dart';

import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/Results/GetResultsRepo.dart';

@injectable
class GetResultsUseCase {
  GetResultsRepo repo;

  @factoryMethod
  GetResultsUseCase(
    this.repo,
  );

  Future<Result<List<ResultModel>>> fetchResults() async {
    return repo.fetchResults();
  }
}
