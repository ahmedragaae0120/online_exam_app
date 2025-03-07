import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/Results/DeleteResultRepo.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/Results/DeleteResultRepo.dart';

@Injectable(as: DeleteResultRepo)
class DeleteResultRepoImpl implements DeleteResultRepo {
  DeleteResultDataSourceRepo repo;

  DeleteResultRepoImpl(this.repo);

  @override
  Future<Result<bool>> deleteResult(String id) {
    return repo.deleteResult(id);
  }
}
