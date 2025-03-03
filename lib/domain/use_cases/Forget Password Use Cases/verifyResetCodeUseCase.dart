import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/Forget%20Password%20Repos/verifyResetCodeRepo.dart';

@injectable
class VerifyresetcodeUseCase {
  VerifyresetcodeRepo repo;
  @factoryMethod
  VerifyresetcodeUseCase({required this.repo});


  Future<Result<bool>> check({required String code}) {
    return repo.verifyResetCode(code: code);
  }
}
