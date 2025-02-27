import 'package:online_exam_app/data/model/questions_response/question_response.dart';
import 'package:online_exam_app/domain/common/result.dart';

abstract class GetQuestionsRepoContract {
  Future<Result<QuestionResponse>> getQuestions(
      String examId, String? userTocken);
}
