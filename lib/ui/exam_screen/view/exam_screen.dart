import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/utils/assets_manager.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/core/utils/text_style_manger.dart';
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
  int quesionCurrent = 1;
  int _correctAnswers = 0;
  late DateTime endTime = DateTime.now().add(Duration(minutes: 10));
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<GetQuestionsCubit>().doIntent(GetQuestionsIntent(
            "670070a830a3c3c1944a9c63",
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return BlocListener<GetQuestionsCubit, GetQuestionsState>(
      listener: (context, state) {
        if (state is GetQuestionsSuccessState) {
          Future.microtask(() {
            setState(() {
              endTime = DateTime.now().add(Duration(
                  minutes:
                      state.questionResponse?.questions?[0].exam?.duration ??
                          10));
            });
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Exam",
          ),
          actions: [
            Row(
              spacing: 5,
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SummaryExamScreen(
                              correctAnswers: _correctAnswers,
                              countOfQuestions: 11),
                        ));
                  },
                ),
              ],
            )
          ],
        ),
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
              return ExamScreenBody(
                getQuestionsSuccessState: state,
                onExamEnd: (int correct) {
                  log(correct.toString());
                  _correctAnswers = correct;
                },
              );
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
