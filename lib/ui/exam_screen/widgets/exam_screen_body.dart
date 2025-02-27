import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/core/utils/text_style_manger.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/get_questions_cubit.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/LinearProgress_custom.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/answer_builder.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/next&back_customButton.dart';
import 'package:online_exam_app/ui/exam_screen/view/summary_exam_screen.dart';

class ExamScreenBody extends StatefulWidget {
  final GetQuestionsSuccessState state;
  final Function(int correct, int incorrect)
      onExamEnd; // Callback عند انتهاء الوقت

  const ExamScreenBody(
      {super.key, required this.state, required this.onExamEnd});

  @override
  State<ExamScreenBody> createState() => _ExamScreenBodyState();
}

class _ExamScreenBodyState extends State<ExamScreenBody> {
  int quesionCurrent = 1;
  static int correctAnswers = 0;
  static int incorrectAnswers = 0;

  void updateScore(bool isCorrect) {
    setState(() {
      if (isCorrect) {
        correctAnswers++;
      } else {
        incorrectAnswers++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Question $quesionCurrent of ${widget.state.questionResponse?.questions?.length ?? 0}",
            textAlign: TextAlign.center,
            style: AppTextStyle.medium14.copyWith(color: AppColors.grey),
          ),
          LinearProgressCustom(
            quesionCurrent: quesionCurrent,
            totalQuestions:
                widget.state.questionResponse?.questions?.length ?? 0,
          ),
          Config.spaceSmall,
          Flexible(
            child: Text(
              widget.state.questionResponse?.questions?[quesionCurrent - 1]
                      .question ??
                  '',
              // questions[quesionCurrent - 1],
              style: AppTextStyle.medium18,
            ),
          ),
          Config.spaceSmall,
          AnswerBuilder(
            answers: widget.state.questionResponse
                    ?.questions?[quesionCurrent - 1].answers ??
                [],
            answerType: AnswerType.single,
            correctAnswerKey: widget.state.questionResponse
                    ?.questions?[quesionCurrent - 1].correct ??
                "",
            onAnswerSelected: updateScore,
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
                        if (quesionCurrent <=
                                (widget.state.questionResponse?.questions
                                        ?.length ??
                                    0) &&
                            quesionCurrent > 1) {
                          setState(() {
                            quesionCurrent--;
                          });
                        }
                      },
                      borderSide: true),
                ),
                Expanded(
                  child: OutlinedFilledButton(
                      text: quesionCurrent ==
                              widget.state.questionResponse?.questions?.length
                          ? "Submit"
                          : "Next",
                      onTap: () {
                        if (quesionCurrent ==
                            widget.state.questionResponse?.questions?.length) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SummaryExamScreen(
                                correctAnswers: correctAnswers,
                                inCorrectAnswers: incorrectAnswers,
                              ),
                            ),
                          );
                        }
                        if (quesionCurrent <
                            (widget.state.questionResponse?.questions?.length ??
                                0)) {
                          setState(() {
                            quesionCurrent++;
                          });
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
  }
}
