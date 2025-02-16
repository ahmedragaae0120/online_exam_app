import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/ForgetPassword_dataSourses/ResetpasswordDataSourceRepo.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/Forget%20Password%20Repos/resetPasswordRepo.dart';

@Injectable(as: ResetpasswordRepo)
class Resetpasswordrepoimpl implements ResetpasswordRepo {
  ResetpasswordDataSourceRepo repo;

  Resetpasswordrepoimpl(this.repo);

  @override
  Future<Result<bool>> resetPassword(
      {required String email, required String password}) {
    return repo.resetPassword(email: email, password: password);
  }
}
