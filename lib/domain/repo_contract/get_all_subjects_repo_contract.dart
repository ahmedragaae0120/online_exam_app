import 'package:online_exam_app/data/model/subject/subject.dart';
import 'package:online_exam_app/domain/common/result.dart';

abstract class GetAllSubjectsRepoContract {
  Future<Result<List<Subject>>> getAllSubjects();
}
