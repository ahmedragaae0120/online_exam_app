import 'package:online_exam_app/data/model/questions_response/QuestionsResponse.dart';
import 'package:online_exam_app/data/model/questions_response/qestions_result_response/QuestionResultResponse.dart';
import 'package:online_exam_app/domain/common/result.dart';

abstract class QuestionsRepoContract {
  Future<Result<QuestionResponse>> getQuestions(String examId);
  Future<Result<QuestionResultResponse>> checkAnswers(
      List<Map<String, dynamic>> answers);
}
