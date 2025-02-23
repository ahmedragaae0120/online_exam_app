import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/profile_datasource.dart';
import 'package:online_exam_app/data/model/profile_response.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/profile_repo_contract.dart';

@Injectable(as: ProfileRepoContract)
class ProfileRepoImpl implements ProfileRepoContract {
  final ProfileDataSourceContract profileDataSource;

  ProfileRepoImpl(this.profileDataSource);

  @override
  Future<Result<UserResponse>> getProfileData() {
    return profileDataSource.getProfileData();
  }

  @override
  Future<Result<UserResponse>> updateProfileData({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    String? password,
  }) {
    return profileDataSource.updateProfileData(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      password: password,
    );
  }
}
