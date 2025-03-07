import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/Forget%20Password%20Repos/resetPasswordRepo.dart';

@injectable
class ResetpasswordUsecase {
  ResetpasswordRepo repo;
  @factoryMethod
  ResetpasswordUsecase({required this.repo});

  Future<Result<bool>> invoke(
      {required String email, required String password}) {
    return repo.resetPassword(email: email, password: password);
  }
}
