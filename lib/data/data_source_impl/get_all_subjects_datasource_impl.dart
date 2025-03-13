import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/api_endpoints.dart';
import 'package:online_exam_app/core/api/api_excuter.dart';
import 'package:online_exam_app/core/api/api_manager.dart';
import 'package:online_exam_app/data/data_source_contract/get_all_subjects_datasource_contract.dart';
import 'package:online_exam_app/domain/common/result.dart';

@Injectable(as: GetAllSubjectsDatasourceContract)
class GetAllSubjectsDatasourceImpl implements GetAllSubjectsDatasourceContract {
  final ApiManager apiManager;

  GetAllSubjectsDatasourceImpl(this.apiManager);

  @override
  Future<Result<List>> getAllSubjects() async {
    return await executeApi<List>(() async {
      var response = await apiManager.getRequest(
        endPoint: ApiEndpoints.getAllSubjectsEndpoint,
      );

      if (response.data == null || response.data['subjects'] == null) {
        return [];
      }

      final subjects = response.data['subjects'];
      if (subjects is List) {
        return subjects;
      }
      return [];
    });
  }
}
