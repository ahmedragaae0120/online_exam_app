import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/api_endpoints.dart';
import 'package:online_exam_app/core/api/api_excuter.dart';
import 'package:online_exam_app/core/api/api_manager.dart';
import 'package:online_exam_app/data/data_source_contract/get_profile_datasource.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: ProfileDataSourceContract)
class ProfileDataSourceImpl implements ProfileDataSourceContract {
  final ApiManager apiManager;

  ProfileDataSourceImpl(this.apiManager);

  @override
  Future<Result<UserResponse>> getProfileData() async {
    return await executeApi<UserResponse>(() async {
      var response = await apiManager.getRequest(
        endPoint: ApiEndpoints.profileDataEndpoint,
      );
      return UserResponse.fromJson(response.data);
    });
  }
}
