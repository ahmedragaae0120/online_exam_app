import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/signup_repo_contract.dart';

@injectable
class SignupUsecase {
  @factoryMethod
  SignupUsecase({required this.signupRepoContract});
  SignupRepoContract signupRepoContract;
  Future<Result<UserResponse>> invoke({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
  }) {
    return signupRepoContract.signUp(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone);
  }
}
