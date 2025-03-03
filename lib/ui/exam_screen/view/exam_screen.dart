import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/utils/assets_manager.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/core/utils/text_style_manger.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/data/model/questions_response/question_response.dart';
import 'package:online_exam_app/ui/exam_screen/view/summary_exam_screen.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/get_questions_cubit.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/get_questions_intent.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/exam_screen_body.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  // int quesionCurrent = 1;
  QuestionResponse? questionResponse;

  late DateTime endTime = DateTime.now().add(Duration(seconds: 10));
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<GetQuestionsCubit>().doIntent(GetQuestionsIntent(
            "670070a830a3c3c1944a9c63", // this id Contains questions
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    final cubit = GetQuestionsCubit.get(context);

    return BlocListener<GetQuestionsCubit, GetQuestionsState>(
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
              BlocBuilder<GetQuestionsCubit, GetQuestionsState>(
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
                          ResultModel result = ResultModel(
                            subject:questionResponse?.questions![0].subject ,
                            examId: questionResponse?.questions?[0].exam?.id,
                            message: questionResponse?.message,
                            questions: questionResponse?.questions,
                            numOfCorrectAnswers: cubit.correctAnswers,
                            exam: questionResponse?.questions?[0].exam,
                            selectedAnswersMap: cubit.selectedAnswersMap,
                          );
                          cubit.doIntent(addResultIntent(result: result));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SummaryExamScreen(
                                    correctAnswers: cubit.correctAnswers,
                                    countOfQuestions: cubit.countOfQuestions),
                              ));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SummaryExamScreen(
                                    correctAnswers: cubit.correctAnswers,
                                    countOfQuestions: cubit.countOfQuestions),
                              ));
                        },
                      ),
                    ],
                  );
                },
              ),
            ]),
        body: BlocBuilder<GetQuestionsCubit, GetQuestionsState>(
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
