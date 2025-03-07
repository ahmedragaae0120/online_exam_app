import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/Results/AddResultRepo.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/Results/AddResultRepo.dart';

@Injectable(as: AddResultRepo)
class AddResultRepoImpl implements AddResultRepo {
  AddResultDataSourceRepo repo;

  AddResultRepoImpl(this.repo);

  @override
  Future<Result<bool>> addResult(ResultModel result) {
    return repo.addResult(result);
  }
}
