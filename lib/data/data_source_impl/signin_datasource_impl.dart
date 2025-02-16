// ignore_for_file: avoid_print

import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/api_endpoints.dart';
import 'package:online_exam_app/core/api/api_excuter.dart';
import 'package:online_exam_app/core/api/api_manager.dart';
import 'package:online_exam_app/data/data_source_contract/signin_datasource.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: SignInDataSourceContract)
class SigninDatasourceImpl implements SignInDataSourceContract {
  final ApiManager apiManager;

  SigninDatasourceImpl(this.apiManager);

  @override
  Future<Result<UserResponse>> signIn({
    required String email,
    required String password,
  }) async {
    return await executeApi<UserResponse>(
      () async {
        var apiResponse = await apiManager.postRequest(
          endPoint: ApiEndpoints.signInEndpoint,
          body: {
            "email": email,
            "password": password,
          },
        );

        print('API Response: ${apiResponse.data}'); // Print full response

        var response = UserResponse.fromJson(apiResponse.data ?? {});
        return response;
      },
    );
  }
}
