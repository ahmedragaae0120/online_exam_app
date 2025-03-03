import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/use_cases/GetResults.dart';
import 'package:online_exam_app/ui/resultsScreen/VeiwModel/result_intent.dart';

part 'result_state.dart';

@injectable
class ResultCubit extends Cubit<ResultState> {
  @factoryMethod
  GetResultsUseCase useCase;

  ResultCubit(this.useCase) : super(ResultInitial());

  static ResultCubit get(BuildContext context) => BlocProvider.of(context);

  void doIntent(ResultIntent intent) {
    switch (intent) {
      case GetResultsIntent():
        _GetResults();
        break;

      case deleteResultIntent():
        _deleteResult(intent: intent);
        break;

    }
  }

  _GetResults() async {
    emit(GetResultsStateLoading());
    final response = await useCase.fetchResults();
    switch (response) {
      case Success():
        {
          emit(GetResultsStateSuccess(result: response.data ?? []));
        }
      case Error():
        {
          emit(GetResultsStateError(
              message: (response.exception as Exception).toString()));
        }
    }
  }

  _deleteResult({required deleteResultIntent intent}) async {
    emit(DeleteResultStateLoading());
    final response = await useCase.deleteResult(
      userId: intent.userId,
      id: intent.id,
    );
    switch (response) {
      case Success():
        {
          emit(DeleteResultStateSuccess(deleted: response.data ?? false));
        }
      case Error():
        {
          emit(DeleteResultStateError(
              message: (response.exception as Exception).toString()));
        }
    }
  }
}
