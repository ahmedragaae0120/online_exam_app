import 'package:online_exam_app/data/model/subject/subject.dart';
import 'package:online_exam_app/domain/common/result.dart';

abstract class GetAllSubjectsDatasourceContract {
  Future<Result<List<Subject>>> getAllSubjects();
}
