import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/signin_datasource.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/sign_in_repo_contract.dart';

@Injectable(as: SignInRepoContract)
class SigninRepoImpl implements SignInRepoContract {
  SignInDataSourceContract signInDataSourceContract;
  @factoryMethod
  SigninRepoImpl(this.signInDataSourceContract);
  @override
  Future<Result<UserResponse>> signIn({
    required String email,
    required String password,
  }) async {
    return signInDataSourceContract.signIn(
      email: email,
      password: password,
    );
  }
}
