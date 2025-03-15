import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/api_endpoints.dart';
import 'package:online_exam_app/core/api/api_excuter.dart';
import 'package:online_exam_app/core/api/api_manager.dart';
import 'package:online_exam_app/data/data_source_contract/get_all_subjects_datasource_contract.dart';
import 'package:online_exam_app/data/model/subject/subject.dart'; // Updated import
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: GetAllSubjectsDatasourceContract)
class GetAllSubjectsDatasourceImpl implements GetAllSubjectsDatasourceContract {
  final ApiManager apiManager;

  GetAllSubjectsDatasourceImpl(this.apiManager);

  @override
  Future<Result<List<Subject>>> getAllSubjects() async {
    return await executeApi<List<Subject>>(() async {
      var response = await apiManager.getRequest(
        endPoint: ApiEndpoints.getAllSubjectsEndpoint,
      );

      final subjects = response.data['subjects'] as List;
      return subjects.map((e) => Subject.fromJson(e)).toList();
    });
  }
}
