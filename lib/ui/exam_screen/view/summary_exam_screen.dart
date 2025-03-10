import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';
import 'package:online_exam_app/core/utils/text_style_manger.dart';
import 'package:online_exam_app/ui/exam_screen/layouts/desktop/summary_exam_desktop_body.dart';
import 'package:online_exam_app/ui/exam_screen/layouts/layout_builder.dart';
import 'package:online_exam_app/ui/exam_screen/layouts/mobile/summary_exam_body.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_cubit.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/Score_Indicator.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/next&back_customButton.dart';
import 'package:online_exam_app/ui/resultsScreen/VeiwModel/result_cubit.dart';
import 'package:online_exam_app/ui/resultsScreen/VeiwModel/result_intent.dart';
import 'package:online_exam_app/ui/resultsScreen/pages/Answers%20Screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SummaryExamScreen extends StatelessWidget {
  final int countOfQuestions;
  final String examId;

  const SummaryExamScreen({
    required this.examId,
    super.key,
    required this.countOfQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Exam score",
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppStrings.homeScreenRoute, (route) => false);
            },
          )),
      body: BlocBuilder<QuestionsCubit, QuestionsState>(
        buildWhen: (previous, current) {
          if (current is CheckAnswersSuccessState ||
              current is CheckAnswersErrorState ||
              current is CheckAnswersLoadingState) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is CheckAnswersErrorState) {
            return Center(
              child:
                  Text(state.message.toString(), style: AppTextStyle.regular25),
            );
          }

          if (state is CheckAnswersSuccessState) {
            return LayoutBuilderWidget(
                mobileLayout: (context) => SummaryExamBody(state: state),
                tabletLayout: (context) => SummaryExamBody(state: state),
                desktopLayout: (context) =>
                    SummaryExamDesktopBody(state: state));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
