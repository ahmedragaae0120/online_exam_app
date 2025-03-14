import 'package:online_exam_app/data/model/subject/subject.dart';

sealed class ExploreState {}

class ExploreInitial extends ExploreState {}

class ExploreLoadingState extends ExploreState {}

class ExploreLoadedState extends ExploreState {
  final List<Subject> subjects;
  ExploreLoadedState({required this.subjects});
}

class ExploreErrorState extends ExploreState {
  final String message;
  ExploreErrorState({required this.message});
}