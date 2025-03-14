import 'package:online_exam_app/data/model/questions_response/exam.dart';

sealed class AllExamsState {}

class AllExamsInitial extends AllExamsState {}

class AllExamsLoadingState extends AllExamsState {}

class AllExamsLoadedState extends AllExamsState {
  final List<Exam> exams;
  AllExamsLoadedState({required this.exams});
}

class AllExamsErrorState extends AllExamsState {
  final String message;
  AllExamsErrorState({required this.message});
}
