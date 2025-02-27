part of 'get_questions_cubit.dart';

sealed class GetQuestionsState {}

final class GetQuestionsInitial extends GetQuestionsState {}

final class GetQuestionsSuccessState extends GetQuestionsState {
  QuestionResponse? questionResponse;
  GetQuestionsSuccessState({this.questionResponse});
}

final class GetQuestionsLoadingState extends GetQuestionsState {
  GetQuestionsLoadingState();
}

final class GetQuestionsErrorState extends GetQuestionsState {
  String? message;
  GetQuestionsErrorState({this.message});
}
