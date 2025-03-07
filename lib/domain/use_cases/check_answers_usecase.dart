import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/questions_response/qestions_result_response/QuestionResultResponse.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/repo_contract/questions_repo_contract/questions_repo_contract.dart';

@injectable
class CheckAnswersUsecase {
  final QuestionsRepoContract _questionsRepoContract;
  @factoryMethod
  CheckAnswersUsecase(this._questionsRepoContract);
  Future<Result<QuestionResultResponse>> call(
          List<Map<String, dynamic>> answers) =>
      _questionsRepoContract.checkAnswers(answers);
}
