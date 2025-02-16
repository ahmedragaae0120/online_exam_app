// ignore_for_file: override_on_non_overriding_member, file_names, non_constant_identifier_names, annotate_overrides, avoid_print

import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/api_endpoints.dart';
import 'package:online_exam_app/core/api/api_excuter.dart';
import 'package:online_exam_app/core/api/api_manager.dart';
import 'package:online_exam_app/data/data_source_contract/ForgetPassword_dataSourses/ForgetPassword_dataSourse.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: ForgetpasswordDataSourseRepo)
class ForgetpasswordDataSourceRepoImpl implements ForgetpasswordDataSourseRepo {
  @override
  final ApiManager apiManager;

  ForgetpasswordDataSourceRepoImpl({required this.apiManager});

  Future<Result<bool>> SendEmailVerification({required String email}) async {
    return await executeApi<bool>(() async {
      var apiResponse = await apiManager.postRequest(
        endPoint: ApiEndpoints.forgetPasswordEndpoint,
        body: {
          "email": email,
        },
      );
      if (apiResponse.data != null &&
          apiResponse.data["message"] == "success") {
        print("✅✅✅✅✅✅✅✅SENT✅✅✅✅✅✅✅✅");
        return true;
      } else {
        return false;
      }
    });
  }
}
