import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/questions_response/question_response.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/use_cases/get_questions_usecase.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/get_questions_intent.dart';

part 'get_questions_state.dart';

@injectable
class GetQuestionsCubit extends Cubit<GetQuestionsState> {
  @factoryMethod
  final GetQuestionsUseCase getQuestionsUseCase;
  GetQuestionsCubit(this.getQuestionsUseCase) : super(GetQuestionsInitial());

  static GetQuestionsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  void doIntent(QuestionsIntent intent) {
    switch (intent) {
      case GetQuestionsIntent():
        _getQuestions(getQuestionsIntent: intent);
        break;
    }
  }

  _getQuestions({required GetQuestionsIntent getQuestionsIntent}) async {
    emit(GetQuestionsLoadingState());
    final result = await getQuestionsUseCase.call(
        getQuestionsIntent.examId, getQuestionsIntent.userTocken);
    switch (result) {
      case Success():
        {
          emit(GetQuestionsSuccessState(questionResponse: result.data));
        }
      case Error():
        {
          emit(GetQuestionsErrorState(message: result.exception.toString()));
        }
    }
  }
}
