import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/questions%20_datasource/questions_datasource_contract.dart';
import 'package:online_exam_app/data/model/questions_response/qestions_result_response/QuestionResultResponse.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/questions_repo_contract/questions_repo_contract.dart';

@Injectable(as: QuestionsRepoContract)
class QuestionsRepoImpl implements QuestionsRepoContract {
  QuestionsDatasourceContract questionsDatasourceContract;
  @factoryMethod
  QuestionsRepoImpl(this.questionsDatasourceContract);

  @override
  Future<Result<QuestionResponse>> getQuestions(
    String examId,
  ) async {
    return await questionsDatasourceContract.getQuestions(
      examId,
    );
  }

  @override
  Future<Result<QuestionResultResponse>> checkAnswers(
      List<Map<String, dynamic>> answers) async {
    return await questionsDatasourceContract.checkAnswers(answers);
  }
}
