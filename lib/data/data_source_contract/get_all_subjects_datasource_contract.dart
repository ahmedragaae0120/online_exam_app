import 'package:online_exam_app/domain/common/result.dart';

abstract class GetAllSubjectsDatasourceContract {
  Future<Result<List<dynamic>>> getAllSubjects();
}
