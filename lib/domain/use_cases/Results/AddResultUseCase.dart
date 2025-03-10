import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/Results/AddResultRepo.dart';

@injectable
class AddResultUseCase {
  AddResultRepo repo;

  @factoryMethod
  AddResultUseCase(
    this.repo,
  );

  Future<Result<bool>> addResult(ResultModel result) async {
    return repo.addResult(result);
  }
}
