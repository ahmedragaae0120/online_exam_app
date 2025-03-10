import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/Results/GetResultsDataSourceRepo.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/Results/GetResultsRepo.dart';

@Injectable(as: GetResultsRepo)
class GetResultsRepoImpl implements GetResultsRepo {
  GetResultsDataSourceRepo repo;

  GetResultsRepoImpl(this.repo);

  @override
  Future<Result<List<ResultModel>>> fetchResults() {
    return repo.fetchResults();
  }
}
