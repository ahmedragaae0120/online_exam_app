import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/api_endpoints.dart';
import 'package:online_exam_app/core/api/api_excuter.dart';
import 'package:online_exam_app/core/api/api_manager.dart';
import 'package:online_exam_app/data/data_source_contract/get_all_exams_on_subject_datasource_contract.dart';
import 'package:online_exam_app/data/model/questions_response/exam.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: GetAllExamsOnSubjectDatasourceContract)
class GetAllExamsOnSubjectDatasourceImpl
    implements GetAllExamsOnSubjectDatasourceContract {
  final ApiManager apiManager;

  GetAllExamsOnSubjectDatasourceImpl(this.apiManager);

  @override
  Future<Result<List<Exam>>> getAllExamsOnSubject(String subjectId) async {
    return await executeApi<List<Exam>>(() async {
      var response = await apiManager.getRequest(
        endPoint: ApiEndpoints.getExamsBySubjectEndpoint(subjectId),
      );

      final exams = response.data['exams'] as List;
      return exams.map((e) => Exam.fromJson(e)).toList();
    });
  }
}
