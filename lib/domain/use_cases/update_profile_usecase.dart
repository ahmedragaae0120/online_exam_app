import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/user_response/user_response.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/update_profile_repo_contract.dart';

@injectable
class UpdateProfileUseCase {
  final UpdateProfileRepoContract updateProfileRepo;

  UpdateProfileUseCase(this.updateProfileRepo);

  Future<Result<UserResponse>> invoke({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    String? password,
  }) async {
    return await updateProfileRepo.updateProfileData(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      password: password,
    );
  }
}
