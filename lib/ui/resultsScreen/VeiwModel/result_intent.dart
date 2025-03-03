import 'package:online_exam_app/data/model/Result/ResultModel.dart';

sealed class ResultIntent {}

class GetResultsIntent extends ResultIntent {
  GetResultsIntent();
}

class deleteResultIntent extends ResultIntent {
  String userId;
  String id;

  deleteResultIntent({required this.userId, required this.id});
}
