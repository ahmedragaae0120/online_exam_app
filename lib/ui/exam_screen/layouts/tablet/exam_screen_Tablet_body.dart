import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';
import 'package:online_exam_app/core/utils/text_style_manger.dart';
import 'package:online_exam_app/data/model/questions_response/question.dart';
import 'package:online_exam_app/ui/exam_screen/view/summary_exam_screen.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_cubit.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_intent.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/LinearProgress_custom.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/answer_builder.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/next&back_customButton.dart';

class ExamScreenTabletBody extends StatelessWidget {
  final GetQuestionsSuccessState getQuestionsSuccessState;

  const ExamScreenTabletBody({
    super.key,
    required this.getQuestionsSuccessState,
  });

  // int quesionCurrent = 1;
  @override
  Widget build(BuildContext context) {
    final int totalQuestions =
        getQuestionsSuccessState.questionResponse?.questions?.length ?? 0;
    final cubit = QuestionsCubit.get(context);

    return BlocBuilder<QuestionsCubit, QuestionsState>(
      buildWhen: (previous, current) {
        if (current is GetQuestionsUpdatedState ||
            current is GetQuestionsResetState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        final Question? currentQuestion = getQuestionsSuccessState
            .questionResponse?.questions?[cubit.quesionCurrent - 1];

        if (state is GetQuestionsUpdatedState) {
          cubit.quesionCurrent = state.quesionCurrent;
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${AppStrings.question} ${cubit.quesionCurrent} ${AppStrings.of} ${totalQuestions.toString()}",
                textAlign: TextAlign.center,
                style: AppTextStyle.medium14.copyWith(color: AppColors.grey),
              ),
              LinearProgressCustom(
                quesionCurrent: cubit.quesionCurrent,
                totalQuestions: totalQuestions,
              ),
              Config.spaceSmall,
              Flexible(
                child: Text(
                  currentQuestion?.question ?? '',
                  style: AppTextStyle.medium18,
                ),
              ),
              Config.spaceSmall,
              AnswerBuilder(
                answers: currentQuestion?.answers ?? [],
                answerType: AnswerType.single,
                correctAnswerKey: currentQuestion?.correct ?? '',
                questionId: currentQuestion?.id ?? '',
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  spacing: 16,
                  children: [
                    Expanded(
                      child: OutlinedFilledButton(
                          text: "Back",
                          onTap: () {
                            cubit.doIntent(PreviousQuestionIntent());
                          },
                          borderSide: true),
                    ),
                    Expanded(
                      child: OutlinedFilledButton(
                          text: cubit.quesionCurrent == totalQuestions
                              ? AppStrings.submit
                              : AppStrings.next,
                          onTap: () {
                            if (cubit.quesionCurrent == totalQuestions) {
                              cubit.doIntent(CheckAnswersIntent());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider.value(
                                    value: cubit,
                                    child: SummaryExamScreen(
                                      getQuestionsSuccessState:
                                          getQuestionsSuccessState,
                                      countOfQuestions: totalQuestions,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              cubit.doIntent(NextQuestionIntent());
                            }
                          },
                          borderSide: false),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
