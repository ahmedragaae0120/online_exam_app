import 'dart:developer';

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
      case NextQuestionIntent():
        _nextQuestion();
        break;
      case PreviousQuestionIntent():
        _previousQuestion();
        break;
      case UpdateAnswerIntent():
        _updateAnswer(intent: intent);
        break;
      case ResetIntent():
        _resetExamData();
        break;
    }
  }

  int quesionCurrent = 1;
  int correctAnswers = 0;
  int countOfQuestions = 0;
  final Map<String, bool> answeredCorrectly =
      {}; // هل السؤال تمت إجابته بشكل صحيح؟
  final Map<String, String?> selectedAnswersMap = {}; // تخزين الإجابات الفردية
  final Map<String, List<String?>> multiSelectedAnswersMap =
      {}; // تخزين إجابات متعددة

  _nextQuestion() {
    quesionCurrent++;
    log("quesionCurrent: $quesionCurrent");
    emit(GetQuestionsUpdatedState(quesionCurrent: quesionCurrent));
  }

  _previousQuestion() {
    if (quesionCurrent > 1) {
      quesionCurrent--;
      log("quesionCurrent: $quesionCurrent");
      emit(GetQuestionsUpdatedState(quesionCurrent: quesionCurrent));
    }
  }

  _updateAnswer({
    required UpdateAnswerIntent intent,
  }) {
    bool isCorrect = intent.selectedAnswerKey == intent.correctKey;
    log("السؤال: ${intent.questionId}");
    log("الإجابة المختارة: ${intent.selectedAnswerKey}");
    log("الإجابة الصحيحة: ${intent.correctKey}");
    log("قبل التحديث - answeredCorrectly: $answeredCorrectly");
    // تحديث خريطة الإجابات الصحيحة
    answeredCorrectly[intent.questionId] = isCorrect;
    log("بعد التحديث - answeredCorrectly: $answeredCorrectly");

    // تحديث الإجابة المختارة
    selectedAnswersMap[intent.questionId] = intent.selectedAnswerKey;

    // إعادة حساب عدد الإجابات الصحيحة بناءً على القيم المخزنة
    correctAnswers = answeredCorrectly.values.where((value) => value).length;

    log("correctAnswers: $correctAnswers");

    emit(GetQuestionsUpdatedState(
        quesionCurrent: quesionCurrent)); // تحديث الواجهة
  }

  _resetExamData() {
    correctAnswers = 0;
    answeredCorrectly.clear();
    selectedAnswersMap.clear();
    multiSelectedAnswersMap.clear();
    emit(GetQuestionsResetState());
  }

  _getQuestions({required GetQuestionsIntent getQuestionsIntent}) async {
    emit(GetQuestionsLoadingState());
    final result = await getQuestionsUseCase.call(getQuestionsIntent.examId);
    switch (result) {
      case Success():
        {
          countOfQuestions = result.data?.questions?.length ?? 0;
          emit(GetQuestionsSuccessState(questionResponse: result.data));
        }
      case Error():
        {
          emit(GetQuestionsErrorState(message: result.exception.toString()));
        }
    }
  }
}
