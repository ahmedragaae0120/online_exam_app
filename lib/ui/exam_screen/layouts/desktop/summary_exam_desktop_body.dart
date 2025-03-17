// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';
import 'package:online_exam_app/core/utils/text_style_manger.dart';
import 'package:online_exam_app/ui/exam_screen/view/exam_screen.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_cubit.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/Score_Indicator.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/next&back_customButton.dart';
import 'package:online_exam_app/ui/resultsScreen/VeiwModel/result_cubit.dart';
import 'package:online_exam_app/ui/resultsScreen/VeiwModel/result_intent.dart';
import 'package:online_exam_app/ui/resultsScreen/pages/Answers%20Screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SummaryExamDesktopBody extends StatelessWidget {
  final CheckAnswersSuccessState state;
  String examId;

  SummaryExamDesktopBody(
      {super.key, required this.examId, required this.state});

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    double area = (Config.screenHight! + Config.screenWidth!) * 2;

    String? totalString =
        state.qestionsResultResponse?.total?.replaceAll("%", "");

    double totalDouble = state.qestionsResultResponse?.total != "NaN%"
        ? double.tryParse(totalString ?? "") ?? 0.0
        : 0.0;
    totalDouble = totalDouble / 100;
    int totalInt = state.qestionsResultResponse?.total != "NaN%"
        ? (double.tryParse(totalString ?? "")?.round() ?? 0)
        : 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 24,
        children: [
          Text(
            AppStrings.yourScore,
            style: AppTextStyle.medium20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: CircularPercentIndicator(
                  radius: area * 0.03,
                  lineWidth: 10,
                  percent: totalDouble,
                  center: Text(
                    "$totalInt%",
                    style: AppTextStyle.medium20,
                  ),
                  progressColor: Theme.of(context).colorScheme.primary,
                  animation: true,
                ),
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ScoreIndicator(
                          label: AppStrings.correct,
                          count:
                              state.qestionsResultResponse?.correct?.toInt() ??
                                  0,
                          isCorrect: true),
                      ScoreIndicator(
                          label: AppStrings.incorrect,
                          count:
                              state.qestionsResultResponse?.wrong?.toInt() ?? 0,
                          isCorrect: false),
                    ]),
              )
            ],
          ),
          Config.spaceMedium,
          OutlinedFilledButton(
              text: AppStrings.showResults,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => getIt<ResultCubit>()
                        ..doIntent(getResultByIdIntent(examId: examId)),
                      child: AnswersScreen(),
                    ),
                  ),
                );
              },
              borderSide: false),
          OutlinedFilledButton(
              text: AppStrings.startAgain,
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => getIt<QuestionsCubit>(),
                              child: ExamScreen(examId: examId),
                            )));
              },
              borderSide: true),
        ],
      ),
    );
  }
}
