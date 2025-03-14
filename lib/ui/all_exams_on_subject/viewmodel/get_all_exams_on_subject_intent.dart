sealed class AllExamsIntent {}

class GetAllExamsOnSubjectIntent extends AllExamsIntent {
  final String subjectId;
  GetAllExamsOnSubjectIntent(this.subjectId);
}
