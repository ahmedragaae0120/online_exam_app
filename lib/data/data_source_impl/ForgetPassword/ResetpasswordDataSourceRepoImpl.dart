import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/api_endpoints.dart';
import 'package:online_exam_app/core/api/api_excuter.dart';
import 'package:online_exam_app/core/api/api_manager.dart';
import 'package:online_exam_app/data/data_source_contract/ForgetPassword_dataSourses/ResetpasswordDataSourceRepo.dart';
import 'package:online_exam_app/domain/common/result.dart';
@Injectable(as: ResetpasswordDataSourceRepo)
class Resetpassworddatasourcerepoimpl implements ResetpasswordDataSourceRepo {
  final ApiManager apiManager;

  Resetpassworddatasourcerepoimpl({required this.apiManager});

  @override
  Future<Result<bool>> resetPassword(
      {required String email, required String password}) async {
    return await executeApi<bool>(() async {
      print("email  : $email ");
      print("password  : $password ");
      var apiResponse = await apiManager.putRequest(
        endPoint: ApiEndpoints.resetPasswordEndpoint,
        body: {
          "email": email,
          "newPassword": password
        },
      );
      if (apiResponse.data != null &&
          apiResponse.data["message"] == "success") {
        print("✅✅✅✅✅✅✅✅PassWord Changed✅✅✅✅✅✅✅✅");
        return true;
      } else {
        print("⛔⛔⛔⛔⛔⛔⛔⛔⛔⛔⛔");
        return false;
      }
    });
  }
  }
