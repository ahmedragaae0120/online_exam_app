import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/data/model/ResultModel.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/use_cases/GetResults.dart';

part 'result_state.dart';

@injectable
class ResultCubit extends Cubit<ResultState> {
  @factoryMethod
  GetResultsUseCase useCase;

  ResultCubit(this.useCase) : super(ResultInitial());

  static ResultCubit get(BuildContext context) => BlocProvider.of(context);

  GetResults() async {
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

  addResult(ResultModel result) async {
    emit(AddResultStateLoading());
    final response = await useCase.addResult(result);
    switch (response) {
      case Success():
        {
          emit(AddResultStateSuccess(added: response.data ?? false));
        }
      case Error():
        {
          emit(AddResultStateError(
              message: (response.exception as Exception).toString()));
        }
    }
  }
}
