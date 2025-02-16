import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/signup_datasource.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/signup_repo_contract.dart';

@Injectable(as: SignupRepoContract)
class SignupRepoImpl implements SignupRepoContract {
  SignUpDataSourceContract signUpDataSourceContract;

  @factoryMethod
  SignupRepoImpl({required this.signUpDataSourceContract});

  @override
  Future<Result<UserResponse>> signUp(
      {required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String confirmPassword,
      required String phone}) async {
    return await signUpDataSourceContract.signUp(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone);
  }
}
