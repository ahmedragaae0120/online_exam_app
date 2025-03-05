import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/get_profile_repo_contract.dart';

@injectable
class GetProfileUseCase {
  final ProfileRepoContract profileRepo;

  GetProfileUseCase(this.profileRepo);

  Future<Result<UserResponse>> invoke() async {
    return await profileRepo.getProfileData();
  }
}
