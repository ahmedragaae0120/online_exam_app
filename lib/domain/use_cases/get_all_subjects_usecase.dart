import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/get_all_subjects_repo_contract.dart';

@injectable
class GetAllSubjectsUsecase {
  final GetAllSubjectsRepoContract getAllSubjectsRepoContract;

  GetAllSubjectsUsecase(this.getAllSubjectsRepoContract);

  Future<Result<List<dynamic>>> execute() =>
      getAllSubjectsRepoContract.getAllSubjects();
}
