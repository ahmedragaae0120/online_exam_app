import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/Forget%20Password%20Repos/ForgetPassword_repo.dart';

@injectable
class ForgetPasswordUseCase {
  ForgetpasswordRepo forgetPassword;
  @factoryMethod
  ForgetPasswordUseCase({required this.forgetPassword});

  Future<Result<bool>> invoke({required String email}) {
    return forgetPassword.SendEmailVerification(email: email);
  }
}
