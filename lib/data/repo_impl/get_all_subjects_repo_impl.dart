import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/get_all_subjects_datasource_contract.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/get_all_subjects_repo_contract.dart';

@Injectable(as: GetAllSubjectsRepoContract)
class GetAllSubjectsRepoImpl implements GetAllSubjectsRepoContract {
  final GetAllSubjectsDatasourceContract getAllSubjectsDatasourceContract;

  GetAllSubjectsRepoImpl(this.getAllSubjectsDatasourceContract);

  @override
  Future<Result<List>> getAllSubjects() {
    return getAllSubjectsDatasourceContract.getAllSubjects();
  }
}
