import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/ForgetPassword_dataSourses/VerifyresetcodeRepoDataSource.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/Forget%20Password%20Repos/verifyResetCodeRepo.dart';

@Injectable(as: VerifyresetcodeRepo)
class Verifyresetcoderepoimpl implements VerifyresetcodeRepo {
  VerifyresetcodeRepoDataSource verifyresetcodeRepoDataSource;
  Verifyresetcoderepoimpl(this.verifyresetcodeRepoDataSource);

  @override
  Future<Result<bool>> verifyResetCode({required String code}) {
    return verifyresetcodeRepoDataSource.verifyResetCode(code: code);
  }
}
