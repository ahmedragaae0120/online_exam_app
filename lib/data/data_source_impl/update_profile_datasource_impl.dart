import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/api_endpoints.dart';
import 'package:online_exam_app/core/api/api_excuter.dart';
import 'package:online_exam_app/core/api/api_manager.dart';
import 'package:online_exam_app/data/data_source_contract/update_profile_datasource.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: UpdateProfileDataSourceContract)
class UpdateProfileDatasourceImpl implements UpdateProfileDataSourceContract {
  final ApiManager apiManager;

  UpdateProfileDatasourceImpl(this.apiManager);
  @override
  Future<Result<UserResponse>> updateProfileData({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    return await executeApi<UserResponse>(() async {
      var body = {
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
      };

      var apiResponse = await apiManager.putRequest(
        endPoint: ApiEndpoints.editProfileEndpoint,
        body: body,
      );
      var response = UserResponse.fromJson(apiResponse.data);
      return response;
    });
  }
}
