import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/questions_response/exam.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/get_all_exams_on_subject_repo_contract.dart';

@injectable
class GetAllExamsOnSubjectUsecase {
  final GetAllExamsOnSubjectRepoContract getAllExamsOnSubjectRepoContract;

  GetAllExamsOnSubjectUsecase(this.getAllExamsOnSubjectRepoContract);

  Future<Result<List<Exam>>> execute(String subjectId) async {
    return await getAllExamsOnSubjectRepoContract
        .getAllExamsOnSubject(subjectId);
  }
}
