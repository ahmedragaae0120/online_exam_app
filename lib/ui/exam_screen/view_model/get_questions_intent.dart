sealed class QuestionsIntent {}

class GetQuestionsIntent extends QuestionsIntent {
  final String examId;
  final String userTocken;
  GetQuestionsIntent(this.examId, this.userTocken);
}
