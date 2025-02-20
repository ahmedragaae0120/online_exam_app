part of 'result_cubit.dart';

@immutable
sealed class ResultState {}

final class ResultInitial extends ResultState {}

class GetResultsStateSuccess extends ResultState {
  final List<ResultModel> result;

  GetResultsStateSuccess({required this.result});
}

class GetResultsStateError extends ResultState {
  final String message;

  GetResultsStateError({required this.message});
}

class GetResultsStateLoading extends ResultState {}

class AddResultStateSuccess extends ResultState {
  final bool added;

  AddResultStateSuccess({required this.added});
}

class AddResultStateError extends ResultState {
  final String message;

  AddResultStateError({required this.message});
}

class AddResultStateLoading extends ResultState {}
