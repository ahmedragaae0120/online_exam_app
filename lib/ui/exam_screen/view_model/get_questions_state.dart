
class AddResultStateSuccess extends GetQuestionsState {
  final bool added;

  AddResultStateSuccess({required this.added});
}

class AddResultStateError extends GetQuestionsState {
  final String message;

  AddResultStateError({required this.message});
}

class AddResultStateLoading extends GetQuestionsState {}