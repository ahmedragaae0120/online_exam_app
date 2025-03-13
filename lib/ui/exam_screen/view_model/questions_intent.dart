import 'package:online_exam_app/data/model/Result/ResultModel.dart';

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
  final String selectedAnswerKey;
  final String correctKey;
  UpdateAnswerIntent(
      {required this.questionId,
      required this.selectedAnswerKey,
      required this.correctKey});
}

class ResetIntent extends QuestionsIntent {
  ResetIntent();
}

class CheckAnswersIntent extends QuestionsIntent {
  CheckAnswersIntent();
}

class addResultIntent extends QuestionsIntent {
  ResultModel result;

  addResultIntent({required this.result});
}
