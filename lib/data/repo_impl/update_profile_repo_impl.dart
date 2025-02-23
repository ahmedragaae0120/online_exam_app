import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/update_profile_datasource.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/update_profile_repo_contract.dart';

@Injectable(as: UpdateProfileRepoContract)
class UpdateProfileRepoImpl implements UpdateProfileRepoContract {
  final UpdateProfileDataSourceContract updateProfileDataSourceContract;

  UpdateProfileRepoImpl({required this.updateProfileDataSourceContract});

  @override
  Future<Result<UserResponse>> updateProfileData({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    String? password,
  }) {
    return updateProfileDataSourceContract.updateProfileData(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      password: password,
    );
  }
}
