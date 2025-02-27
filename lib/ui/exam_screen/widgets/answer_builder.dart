import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/data/model/questions_response/Answers.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/multi_choice_answer_widget.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/single_choice_answer_widget.dart';

enum AnswerType { single, multiple }

class AnswerBuilder extends StatefulWidget {
  final List<Answer> answers;
  final AnswerType answerType;
  final String correctAnswerKey; // المفتاح الصحيح للإجابة
  final Function(bool) onAnswerSelected;
  const AnswerBuilder(
      {super.key,
      required this.answers,
      required this.answerType,
      required this.correctAnswerKey,
      required this.onAnswerSelected});

  @override
  State<AnswerBuilder> createState() => _AnswerBuilderState();
}

class _AnswerBuilderState extends State<AnswerBuilder> {
  String? selectedAnswer;

  List<String?> selectedAnswers = [];

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.answers.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        String currentAnswer = widget.answers[index].answer ?? '';

        return widget.answerType == AnswerType.single
            ? SingleChoiceAnswerWidget(
                answerText: currentAnswer,
                isSelected: selectedAnswer == currentAnswer,
                onSelect: () {
                  setState(() {
                    selectedAnswer = currentAnswer;
                  });

                  bool isCorrect = false; // المتغير الذي سيحدد صحة الإجابة
                  for (Answer answer in widget.answers) {
                    if (answer.answer == selectedAnswer) {
                      // ابحث عن الإجابة المختارة
                      if (answer.key == widget.correctAnswerKey) {
                        // قارن المفتاح
                        isCorrect = true;
                      }
                      break; // بمجرد العثور على الإجابة المطابقة، نخرج من الحلقة
                    }
                  }
                  widget.onAnswerSelected(isCorrect);

                  // bool isCorrect = widget.answers
                  //         .firstWhere(
                  //             (answer) => answer.answer == selectedAnswer)
                  //         .key ==
                  //     widget.correctAnswerKey;
                  // widget.onAnswerSelected(isCorrect);
                },
              )
            : MultiChoiceAnswerWidget(
                answerText: currentAnswer,
                isSelected: selectedAnswers.contains(currentAnswer),
                onSelect: () {
                  setState(() {
                    if (selectedAnswers.contains(currentAnswer)) {
                      selectedAnswers.remove(currentAnswer);
                    } else {
                      selectedAnswers.add(currentAnswer);
                    }
                  });
                },
              );
      },
      separatorBuilder: (BuildContext context, int index) => Config.spaceSmall,
    );
  }
}
