import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';

abstract class ProfileDataSourceContract {
  Future<Result<UserResponse>> getProfileData();
}
