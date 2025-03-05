import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/questions_repo_contract/questions_repo_contract.dart';

@injectable
class GetQuestionsUseCase {
  final QuestionsRepoContract _questionsRepoContract;
  @factoryMethod
  GetQuestionsUseCase(this._questionsRepoContract);

  Future<Result<QuestionResponse>> call(String examId) {
    return _questionsRepoContract.getQuestions(
      examId,
    );
  }
}
