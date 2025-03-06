import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/model/questions_response/QuestionsResponse.dart';
import 'package:online_exam_app/data/model/questions_response/qestions_result_response/CorrectQuestions.dart';
import 'package:online_exam_app/data/model/questions_response/qestions_result_response/QuestionResultResponse.dart';
import 'package:online_exam_app/data/model/questions_response/qestions_result_response/WrongQuestions.dart';
import 'package:online_exam_app/domain/common/result.dart';
import 'package:online_exam_app/domain/use_cases/GetResults.dart';
import 'package:online_exam_app/domain/use_cases/check_answers_usecase.dart';
import 'package:online_exam_app/domain/use_cases/get_questions_usecase.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_intent.dart';

part 'questions_state.dart';

@injectable
class QuestionsCubit extends Cubit<QuestionsState> {
  @factoryMethod
  final GetQuestionsUseCase getQuestionsUseCase;
  final CheckAnswersUsecase checkAnswersUsecase;
  GetResultsUseCase getResultsIseCase;
  QuestionsCubit(this.getResultsIseCase,this.getQuestionsUseCase, this.checkAnswersUsecase)
      : super(QuestionsInitial()) {
    log("🚀 GetQuestionsCubit Initialized! selectedAnswersMap: $selectedAnswersMap");
  }

  static QuestionsCubit get(BuildContext context) => BlocProvider.of(context);

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
      case CheckAnswersIntent():
        _checkAnswers();
        break;
      case addResultIntent():
        _addResult(intent: intent);
        break;
    }
  }

  int quesionCurrent = 1;
  int countOfQuestions = 0;
  List<WrongQuestions>? wrongQuestions;
  List<CorrectQuestions>? correctQuestions;
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
    log("السؤال: ${intent.questionId}");
    log("الإجابة المختارة: ${intent.selectedAnswerKey}");
    log("الإجابة الصحيحة: ${intent.correctKey}");
    // تحديث الإجابة المختارة
    selectedAnswersMap[intent.questionId] = intent.selectedAnswerKey;
    log("✅ تم تحديث selectedAnswersMap: $selectedAnswersMap");

    emit(GetQuestionsUpdatedState(
        quesionCurrent: quesionCurrent)); // تحديث الواجهة
  }

  _resetExamData() {
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
  _addResult({required addResultIntent intent}) async {
    emit(AddResultStateLoading());
    final response = await getResultsIseCase.addResult(intent.result);
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
  _checkAnswers() async {
    log("selectedAnswersMap: $selectedAnswersMap"); // طباعة محتويات الخريطة
    // تحويل البيانات إلى الهيكل المطلوب
    List<Map<String, String?>> requestBody = selectedAnswersMap.entries
        .map(
          (entry) => {
            "questionId": entry.key,
            "correct": entry.value,
          },
        )
        .toList();

    log("📤 البيانات المرسلة للـ API: $requestBody");
    emit(CheckAnswersLoadingState());
    if (isClosed) return;
    final result = await checkAnswersUsecase.call(requestBody);
    if (isClosed) return;
    switch (result) {
      case Success():
        {
          wrongQuestions=result.data?.wrongQuestions;
          correctQuestions=result.data?.correctQuestions;
          emit(CheckAnswersSuccessState(qestionsResultResponse: result.data));
        }
      case Error():
        {
          emit(CheckAnswersErrorState(message: result.exception.toString()));
        }
    }
  }
}
