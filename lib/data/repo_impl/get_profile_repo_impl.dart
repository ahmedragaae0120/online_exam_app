import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/get_profile_datasource.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/get_profile_repo_contract.dart';

@Injectable(as: ProfileRepoContract)
class ProfileRepoImpl implements ProfileRepoContract {
  final ProfileDataSourceContract profileDataSource;

  ProfileRepoImpl(this.profileDataSource);

  @override
  Future<Result<UserResponse>> getProfileData() {
    return profileDataSource.getProfileData();
  }
}
