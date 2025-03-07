import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/Results/GetResultsByIdRepo.dart';

@injectable
class GetResultsByIdUseCase {
  GetResultsByIdRepo repo;

  @factoryMethod
  GetResultsByIdUseCase(
    this.repo,
  );

  Future<Result<ResultModel>> getResultById({required String examId}) async {
    return repo.getResultById(examId);
  }
}
