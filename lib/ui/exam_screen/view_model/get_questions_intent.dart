import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/data/model/questions_response/Answers.dart';

sealed class QuestionsIntent {}

class GetQuestionsIntent extends QuestionsIntent {
  final String examId;
  GetQuestionsIntent(
    this.examId,
  );
}

class NextQuestionIntent extends QuestionsIntent {
  NextQuestionIntent();
}

class PreviousQuestionIntent extends QuestionsIntent {
  PreviousQuestionIntent();
}

class UpdateAnswerIntent extends QuestionsIntent {
  final String questionId;
  final Answer selectedAnswer;
  final String correctKey;
  UpdateAnswerIntent(
      {required this.questionId,
      required this.selectedAnswer,
      required this.correctKey});
}

class ResetIntent extends QuestionsIntent {
  ResetIntent();
}


class addResultIntent extends QuestionsIntent {
  ResultModel result;

  addResultIntent({required this.result});
}