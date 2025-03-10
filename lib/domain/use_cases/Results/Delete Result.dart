import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/Results/DeleteResultRepo.dart';

@injectable
class DeleteResultUseCase {
  DeleteResultRepo repo;

  @factoryMethod
  DeleteResultUseCase(
    this.repo,
  );

  Future<Result<bool>> deleteResult({required String id}) async {
    return repo.deleteResult(id);
  }
}
