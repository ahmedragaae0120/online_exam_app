import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/utils/assets_manager.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/core/utils/text_style_manger.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/data/model/questions_response/QuestionsResponse.dart';
import 'package:online_exam_app/data/model/questions_response/qestions_result_response/QuestionResultResponse.dart';
import 'package:online_exam_app/ui/exam_screen/view/summary_exam_screen.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_cubit.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_intent.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/exam_screen_body.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  QuestionResponse? questionResponse;

  late DateTime endTime = DateTime.now().add(Duration(seconds: 10));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<QuestionsCubit>().doIntent(GetQuestionsIntent(
            "670070a830a3c3c1944a9c63", // this id Contains questions
            // "6700707030a3c3c1944a9c5d", // this id not Contains questions
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    final cubit = QuestionsCubit.get(context);

    return BlocListener<QuestionsCubit, QuestionsState>(
      listener: (context, state) {
        if (state is GetQuestionsSuccessState) {
          questionResponse = state.questionResponse;
          if (state.questionResponse?.questions?.isEmpty ?? true) {
            setState(() {
              endTime = DateTime.now();
            });
          } else {
            Future.microtask(() {
              setState(() {
                endTime = DateTime.now().add(Duration(
                    minutes:
                        state.questionResponse?.questions?[0].exam?.duration ??
                            10));
              });
            });
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              "Exam",
            ),
            actions: [
              BlocBuilder<QuestionsCubit, QuestionsState>(
                builder: (context, state) {
                  if (state is GetQuestionsLoadingState) {
                    return Text("loading please wait...",
                        style: AppTextStyle.regular25);
                  }
                  if (state is GetQuestionsSuccessState &&
                      (state.questionResponse?.questions?.isEmpty ?? true)) {
                    return SizedBox();
                  }
                  return Row(
                    children: [
                      Image.asset(AssetsManager.resourceClock),
                      TimerCountdown(
                          enableDescriptions: false,
                          format: CountDownTimerFormat.minutesSeconds,
                          timeTextStyle: AppTextStyle.semiBold20.copyWith(
                            color: AppColors.success,
                          ),
                          endTime: endTime,
                          onEnd: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                  value: cubit..doIntent(CheckAnswersIntent()),
                                  child: BlocListener<QuestionsCubit,
                                      QuestionsState>(
                                    listener: (context, state) {
                                      if (state is CheckAnswersSuccessState) {
                                        // Wait for checking to complete
                                        cubit.doIntent(addResultIntent(
                                          result: ResultModel(

                                            correctQuestions:
                                                cubit.correctQuestions,
                                            selectedAnswersMap:
                                                cubit.selectedAnswersMap,
                                            wrongQuestions:
                                                cubit.wrongQuestions,
                                            subject: questionResponse
                                                ?.questions![0].subject,
                                            examId: questionResponse
                                                ?.questions?[0].exam?.id,
                                            message: questionResponse?.message,
                                            questions:
                                                questionResponse?.questions,
                                            exam: questionResponse
                                                ?.questions?[0].exam,
                                          ),
                                        ));
                                      }
                                    },
                                    child: SummaryExamScreen(
                                      countOfQuestions: cubit.countOfQuestions,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ],
                  );
                },
              ),
            ]),
        body: BlocBuilder<QuestionsCubit, QuestionsState>(
          buildWhen: (previous, current) {
            if (current is GetQuestionsSuccessState ||
                current is GetQuestionsLoadingState ||
                current is GetQuestionsErrorState) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            if (state is GetQuestionsSuccessState) {
              if (state.questionResponse?.questions?.isEmpty ?? true) {
                return Center(
                    child: Text("No Questions", style: AppTextStyle.regular25));
              } else {
                return ExamScreenBody(
                  getQuestionsSuccessState: state,
                );
              }
            }
            if (state is GetQuestionsErrorState) {
              return Center(
                child: Text(state.message.toString(),
                    style: AppTextStyle.regular25),
              );
            }
            return Center(child: CircularProgressIndicator.adaptive());
          },
        ),
      ),
    );
  }
}
