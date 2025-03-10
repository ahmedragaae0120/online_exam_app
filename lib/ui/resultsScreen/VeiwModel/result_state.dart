part of 'result_cubit.dart';

@immutable
sealed class ResultState {}

final class ResultInitial extends ResultState {}
        //========================\\

class GetResultsStateSuccess extends ResultState {
  final List<ResultModel> result;

  GetResultsStateSuccess({required this.result});
}

class GetResultsStateError extends ResultState {
  final String message;

  GetResultsStateError({required this.message});
}

class GetResultsStateLoading extends ResultState {}
        //========================\\

class GetResultByIdStateSuccess extends ResultState {
  final ResultModel? result;

  GetResultByIdStateSuccess({required this.result});
}

class GetResultByIdStateError extends ResultState {
  final String message;

  GetResultByIdStateError({required this.message});
}

class GetResultByIdStateLoading extends ResultState {}
        //========================\\

class DeleteResultStateSuccess extends ResultState {
  final bool deleted;

  DeleteResultStateSuccess({required this.deleted});
}

class DeleteResultStateError extends ResultState {
  final String message;

  DeleteResultStateError({required this.message});
}

class DeleteResultStateLoading extends ResultState {}
