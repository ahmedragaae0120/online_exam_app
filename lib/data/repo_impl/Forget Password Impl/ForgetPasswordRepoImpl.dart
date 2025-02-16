import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/ForgetPassword_dataSourses/ForgetPassword_dataSourse.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/Forget%20Password%20Repos/ForgetPassword_repo.dart';

@Injectable(as: ForgetpasswordRepo)
class Forgetpasswordrepoimpl implements ForgetpasswordRepo {
  ForgetpasswordDataSourseRepo forgetpassword_data_sourse_repo;

  Forgetpasswordrepoimpl({required this.forgetpassword_data_sourse_repo});

  @override
  Future<Result<bool>> SendEmailVerification({required String email}) {
    return forgetpassword_data_sourse_repo.SendEmailVerification(email: email);
  }
}
