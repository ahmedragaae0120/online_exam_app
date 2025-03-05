import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/sign_in_repo_contract.dart';

@injectable
class SigninUsecase {
  final SignInRepoContract signInRepoContract;

  @factoryMethod
  SigninUsecase({
    required this.signInRepoContract,
  });

  Future<Result<UserResponse>> invoke({
    required String email,
    required String password,
  }) async {
    final result =
        await signInRepoContract.signIn(email: email, password: password);

    return result;
  }
}
