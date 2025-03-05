part of 'questions_cubit.dart';

sealed class QuestionsState {}

final class QuestionsInitial extends QuestionsState {}

final class GetQuestionsSuccessState extends QuestionsState {
  QuestionResponse? questionResponse;
  GetQuestionsSuccessState({this.questionResponse});
}

final class GetQuestionsLoadingState extends QuestionsState {
  GetQuestionsLoadingState();
}

final class GetQuestionsErrorState extends QuestionsState {
  String? message;
  GetQuestionsErrorState({this.message});
}

/// **حالة يتم إرسالها عند تحديث السؤال الحالي**

class GetQuestionsUpdatedState extends QuestionsState {
  final int quesionCurrent;
  GetQuestionsUpdatedState({required this.quesionCurrent});
}

/// **حالة يتم إرسالها عند إعادة ضبط الامتحان**
class GetQuestionsResetState extends QuestionsState {
  GetQuestionsResetState();
}

class CheckAnswersSuccessState extends QuestionsState {
  final QuestionResultResponse? qestionsResultResponse;
  CheckAnswersSuccessState({required this.qestionsResultResponse});
}

class CheckAnswersLoadingState extends QuestionsState {}

class CheckAnswersErrorState extends QuestionsState {
  String? message;
  CheckAnswersErrorState({this.message});
}
