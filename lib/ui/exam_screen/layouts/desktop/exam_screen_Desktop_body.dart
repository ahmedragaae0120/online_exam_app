import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/core/utils/text_style_manger.dart';
import 'package:online_exam_app/data/model/questions_response/question.dart';
import 'package:online_exam_app/ui/exam_screen/view/summary_exam_screen.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_cubit.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_intent.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/LinearProgress_custom.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/answer_builder.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/next&back_customButton.dart';

class ExamScreenDesktopBody extends StatelessWidget {
  final GetQuestionsSuccessState getQuestionsSuccessState;

  const ExamScreenDesktopBody({
    super.key,
    required this.getQuestionsSuccessState,
  });

  // int quesionCurrent = 1;
  @override
  Widget build(BuildContext context) {
    final int totalQuestions =
        getQuestionsSuccessState.questionResponse?.questions?.length ?? 0;
    final cubit = QuestionsCubit.get(context);
    Config().init(context);

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
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: Config.screenWidth! * 0.6,
                        child: LinearProgressCustom(
                          quesionCurrent: cubit.quesionCurrent,
                          totalQuestions: totalQuestions,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "Question ${cubit.quesionCurrent} of ${totalQuestions.toString()}",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.medium14
                              .copyWith(color: AppColors.grey),
                        ),
                      ),
                      SizedBox(height: Config.screenHight! * 0.3),
                      Flexible(
                        fit: FlexFit.loose,
                        child: OutlinedFilledButton(
                            text: "Back",
                            onTap: () {
                              cubit.doIntent(PreviousQuestionIntent());
                            },
                            borderSide: true),
                      ),
                      SizedBox(height: Config.screenHight! * 0.1),
                      Flexible(
                        fit: FlexFit.loose,
                        child: OutlinedFilledButton(
                            text: cubit.quesionCurrent == totalQuestions
                                ? "Submit"
                                : "Next",
                            onTap: () {
                              if (cubit.quesionCurrent == totalQuestions) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider.value(
                                      value: cubit
                                        ..doIntent(CheckAnswersIntent()),
                                      child: SummaryExamScreen(
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
                      )
                    ]),
              ),
              VerticalDivider(
                width: 3,
                thickness: 3,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            currentQuestion?.question ?? '',
                            style: AppTextStyle.medium18,
                          ),
                        ),
                        Config.spaceSmall,
                        SizedBox(
                          width: double.infinity,
                          child: AnswerBuilder(
                            answers: currentQuestion?.answers ?? [],
                            answerType: AnswerType.single,
                            correctAnswerKey: currentQuestion?.correct ?? '',
                            questionId: currentQuestion?.id ?? '',
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
