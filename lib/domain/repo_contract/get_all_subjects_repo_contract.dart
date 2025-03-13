import 'package:online_exam_app/domain/common/result.dart';

abstract class GetAllSubjectsRepoContract {
  Future<Result<List<dynamic>>> getAllSubjects();
}
