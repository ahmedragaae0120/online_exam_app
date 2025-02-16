import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/api_endpoints.dart';
import 'package:online_exam_app/core/api/api_excuter.dart';
import 'package:online_exam_app/core/api/api_manager.dart';
import 'package:online_exam_app/data/data_source_contract/ForgetPassword_dataSourses/VerifyresetcodeRepoDataSource.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: VerifyresetcodeRepoDataSource)
 class Verifyresetcoderepodatasourceimpl
    implements VerifyresetcodeRepoDataSource {
  final ApiManager apiManager;

  Verifyresetcoderepodatasourceimpl({required this.apiManager});

  Future<Result<bool>> verifyResetCode({required String code}) async {
    return await executeApi<bool>(() async {
      var apiResponse = await apiManager.postRequest(
        endPoint: ApiEndpoints.verifyResetCodeEndpoint,
        body: {
          "resetCode": code,
        },
      );
      if (apiResponse.data != null &&
          apiResponse.data["status"] == "Success") {
        print("✅✅✅✅✅✅✅✅same code✅✅✅✅✅✅✅✅");
        return true;
      } else {
        return false;
      }
    });
  }
}
