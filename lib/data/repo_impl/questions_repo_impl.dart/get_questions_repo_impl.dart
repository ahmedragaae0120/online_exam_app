import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/data_source_contract/questions%20_datasource/get_questions_datasource_contract.dart';
import 'package:online_exam_app/data/model/questions_response/question_response.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/questions_repo_contract/get_questions_repo_contract.dart';

@Injectable(as: GetQuestionsRepoContract)
class GetQuestionsRepoImpl implements GetQuestionsRepoContract {
  GetQuestionsDatasourceContract getQuestionsDatasourceContract;
  @factoryMethod
  GetQuestionsRepoImpl(this.getQuestionsDatasourceContract);

  @override
  Future<Result<QuestionResponse>> getQuestions(
    String examId,
  ) async {
    return await getQuestionsDatasourceContract.getQuestions(
      examId,
    );
  }
}
