import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/questions_response/question_response.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/questions_repo_contract/get_questions_repo_contract.dart';

@injectable
class GetQuestionsUseCase {
  final GetQuestionsRepoContract _getQuestionsRepoContract;
  @factoryMethod
  GetQuestionsUseCase(this._getQuestionsRepoContract);

  Future<Result<QuestionResponse>> call(String examId) {
    return _getQuestionsRepoContract.getQuestions(
      examId,
    );
  }
}
