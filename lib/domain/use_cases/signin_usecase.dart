import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/sign_in_repo_contract.dart';

@injectable
class SigninUsecase {
  final SignInRepoContract signInRepoContract;
  // final TokenStorageService tokenStorage;
  // final UserService userService;

  @factoryMethod
  SigninUsecase({
    required this.signInRepoContract,
  });

  Future<Result<UserResponse>> invoke(
      {required String email,
      required String password,
      required bool rememberMe}) async {
    return await signInRepoContract.signIn(
        email: email, password: password, rememberMe: rememberMe);

    // if (result is Success<UserResponse>) {
    //   final response = result.data;
    //   if (response?.token != null) {
    //     print('Token before saving: ${response!.token}');
    //     print('Remember Me value: $rememberMe');

    //     await tokenStorage.saveToken(response.token!, rememberMe);

    //     // Verify token was stored
    //     final storedToken = tokenStorage.getToken();
    //     print('Token after saving: $storedToken');
    //     print('Remember Me stored value: ${tokenStorage.getRememberMe()}');

    //     // Store user data
    //     if (response.user != null) {
    //       userService.setCurrentUser(response.user);
    //     }
    //   }
    // }
  }
}
