import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/data/model/questions_response/Answers.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_cubit.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_intent.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/multi_choice_answer_widget.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/single_choice_answer_widget.dart';

enum AnswerType { single, multiple }

enum AnswerTypeStatus { Empty, Correct, Wrong }

class AnswerBuilder extends StatelessWidget {
  final AnswerTypeStatus? answerStatus;
  final List<Answer> answers;
  final AnswerType answerType;
  final String correctAnswerKey;
  final String questionId;

  AnswerBuilder({
    super.key,
    this.answerStatus,
    required this.answers,
    required this.answerType,
    required this.correctAnswerKey,
    required this.questionId,
  });

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    final cubit = QuestionsCubit.get(context);

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: (answerStatus == AnswerTypeStatus.Empty) ? Colors.red : Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: (answerStatus == AnswerTypeStatus.Empty) ? Colors.red[200] : Colors.transparent,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: answers.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          String currentAnswer = answers[index].answer ?? '';
          bool isSelected = cubit.selectedAnswersMap[questionId] == answers[index].key;

          return answerType == AnswerType.single
              ? SingleChoiceAnswerWidget(
            answerStatus: answers[index].key == correctAnswerKey
                ? AnswerTypeStatus.Correct
                : (isSelected ? AnswerTypeStatus.Wrong : AnswerTypeStatus.Empty),
            answerText: currentAnswer,
            isSelected: isSelected,
            onSelect: () {
              cubit.doIntent(UpdateAnswerIntent(
                correctKey: correctAnswerKey,
                selectedAnswerKey: answers[index].key ?? "",
                questionId: questionId,
              ));
            },
          )
              : MultiChoiceAnswerWidget(
            answerText: currentAnswer,
            isSelected: cubit.multiSelectedAnswersMap[questionId]?.contains(answers[index].key) ?? false,
            onSelect: () {

            },
          );
        },
        separatorBuilder: (context, index) => Config.spaceSmall,
      ),
    );
  }
}
