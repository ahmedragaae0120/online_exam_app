import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';
import 'package:online_exam_app/core/utils/text_style_manger.dart';
import 'package:online_exam_app/ui/exam_screen/layouts/desktop/summary_exam_desktop_body.dart';
import 'package:online_exam_app/ui/exam_screen/layouts/layout_builder.dart';
import 'package:online_exam_app/ui/exam_screen/layouts/mobile/summary_exam_body.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_cubit.dart';

class SummaryExamScreen extends StatelessWidget {
  final int countOfQuestions;
  const SummaryExamScreen({
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
              Navigator.pushNamed(context, AppStrings.homeScreenRoute);
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
