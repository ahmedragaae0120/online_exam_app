sealed class ResultIntent {}

class GetResultsIntent extends ResultIntent {
  GetResultsIntent();
}

class deleteResultIntent extends ResultIntent {
  String examId;

  deleteResultIntent({required this.examId});
}

class getResultByIdIntent extends ResultIntent {
  String examId;

  getResultByIdIntent({required this.examId});
}
