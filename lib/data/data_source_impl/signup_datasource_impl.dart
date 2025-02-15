import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/api_endpoints.dart';
import 'package:online_exam_app/core/api/api_excuter.dart';
import 'package:online_exam_app/core/api/api_manager.dart';
import 'package:online_exam_app/data/data_source_contract/signup_datasource.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: SignUpDataSourceContract)
class SignUpDataSourceImpl implements SignUpDataSourceContract {
  ApiManager apiManager;
  @factoryMethod
  SignUpDataSourceImpl(this.apiManager);
  @override
  Future<Result<UserResponse>> signUp(
      {required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String confirmPassword,
      required String phone}) async {
    return executeApi<UserResponse>(() async {
      var apiResponse = await apiManager.postRequest(
        endPoint: ApiEndpoints.signUpEndpoint,
        body: {
          "username": username,
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "rePassword": confirmPassword,
          "phone": phone
        },
      );
      // log(apiResponse.data.toString());
      var response = UserResponse.fromJson(apiResponse.data ?? {});
      // log(response.toString());
      return response;
    });
  }
}
