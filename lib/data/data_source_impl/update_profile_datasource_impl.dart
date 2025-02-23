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
    String? password,
  }) async {
    return await executeApi<UserResponse>(() async {
      var body = {
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
      };

      if (password != null && password.isNotEmpty) {
        body["password"] = password;
      }

      var response = await apiManager.putRequest(
        endPoint: ApiEndpoints.editProfileEndpoint,
        body: body,
      );

      // Handle the response based on its type
      if (response.data is String) {
        return UserResponse(message: response.data as String);
      } else if (response.data is Map<String, dynamic>) {
        return UserResponse.fromJson(response.data);
      }
      throw Exception('Unexpected response format');
    });
  }
}
