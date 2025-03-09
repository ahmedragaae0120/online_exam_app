import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/data/model/questions_response/Answers.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_cubit.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_intent.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/multi_choice_answer_widget.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/single_choice_answer_widget.dart';

enum AnswerType { single, multiple }

class AnswerBuilder extends StatelessWidget {
  final List<Answer> answers;
  final AnswerType answerType;
  final String correctAnswerKey; // المفتاح الصحيح للإجابة
  final String questionId;
  const AnswerBuilder(
      {super.key,
      required this.answers,
      required this.answerType,
      required this.correctAnswerKey,
      required this.questionId});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    final cubit = QuestionsCubit.get(context);

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1, 0),
              end: Offset(0, 0),
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: ListView.separated(
        key: Key(questionId),
        physics: NeverScrollableScrollPhysics(),
        itemCount: answers.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          String currentAnswer = answers[index].answer ?? '';
          bool isSelected =
              cubit.selectedAnswersMap[questionId] == answers[index].key;

          return answerType == AnswerType.single
              ? SingleChoiceAnswerWidget(
                  answerText: currentAnswer,
                  isSelected: isSelected,
                  onSelect: () {
                    cubit.doIntent(UpdateAnswerIntent(
                      correctKey: correctAnswerKey,
                      selectedAnswerKey: answers[index].key ?? '',
                      questionId: questionId,
                    ));
                  },
                )
              : MultiChoiceAnswerWidget(
                  answerText: currentAnswer,
                  isSelected: cubit.multiSelectedAnswersMap[questionId]!
                      .contains(currentAnswer),
                  onSelect: () {
                    // setState(() {
                    //   if (multiSelectedAnswersMap[widget.questionId]!
                    //       .contains(currentAnswer)) {
                    //     multiSelectedAnswersMap[widget.questionId]!
                    //         .remove(currentAnswer);
                    //   } else {
                    //     multiSelectedAnswersMap[widget.questionId]!
                    //         .add(currentAnswer);
                    //   }
                    // });
                  },
                );
        },
        separatorBuilder: (BuildContext context, int index) =>
            Config.spaceSmall,
      ),
    );
  }
}
