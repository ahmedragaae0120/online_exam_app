import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/Results/GetResultsByIdRepo.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/Results/GetResultsByIdRepo.dart';

@Injectable(as: GetResultsByIdRepo)
class GetResultsByIdRepoImpl implements GetResultsByIdRepo {
  GetResultsByIdDataSourceRepo repo;

  GetResultsByIdRepoImpl(this.repo);

  @override
  Future<Result<ResultModel>> getResultById(String id) {
    return repo.getResultById(id);
  }
}
