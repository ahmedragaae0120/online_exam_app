import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/get_all_exams_on_subject_datasource_contract.dart';
import 'package:online_exam_app/data/model/questions_response/exam.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/get_all_exams_on_subject_repo_contract.dart';

@Injectable(as: GetAllExamsOnSubjectRepoContract)
class GetAllExamsOnSubjectRepoImpl implements GetAllExamsOnSubjectRepoContract {
  final GetAllExamsOnSubjectDatasourceContract
      getAllExamsOnSubjectDatasourceContract;

  GetAllExamsOnSubjectRepoImpl(this.getAllExamsOnSubjectDatasourceContract);

  @override
  Future<Result<List<Exam>>> getAllExamsOnSubject(String subjectId) {
    return getAllExamsOnSubjectDatasourceContract
        .getAllExamsOnSubject(subjectId);
  }
}
