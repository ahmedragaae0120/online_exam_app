import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/api_endpoints.dart';
import 'package:online_exam_app/core/api/api_excuter.dart';
import 'package:online_exam_app/core/api/api_manager.dart';
import 'package:online_exam_app/data/data_source_contract/change_password_datasource.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: ChangePasswordDataSourceContract)
class ChangePasswordDataSourceImpl implements ChangePasswordDataSourceContract {
  ApiManager apiManager;

  @factoryMethod
  ChangePasswordDataSourceImpl(this.apiManager);

  @override
  Future<Result<void>> changePassword({
    required String oldPassword,
    required String password,
    required String rePassword,
  }) async {
    return await executeApi<void>(() async {
      await apiManager.patchRequest(
        endPoint: ApiEndpoints.changePasswordEndpoint,
        body: {
          "oldPassword": oldPassword,
          "password": password,
          "rePassword": rePassword,
        },
      );
      return;
    });
  }
}
