import 'package:flutter/material.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/multi_choice_answer_widget.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/single_choice_answer_widget.dart';

enum AnswerType { single, multiple }

class AnswerBuilder extends StatefulWidget {
  final List<String> answers;
  final AnswerType answerType;
  const AnswerBuilder(
      {super.key, required this.answers, required this.answerType});

  @override
  State<AnswerBuilder> createState() => _AnswerBuilderState();
}

class _AnswerBuilderState extends State<AnswerBuilder> {
  String? selectedAnswer;

  List<String?> selectedAnswers = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.answers.length,
        itemBuilder: (context, index) {
          String currentAnswer = widget.answers[index];

          return widget.answerType == AnswerType.single
              ? SingleChoiceAnswerWidget(
                  answerText: currentAnswer,
                  isSelected: selectedAnswer == currentAnswer,
                  onSelect: () {
                    setState(() {
                      selectedAnswer = currentAnswer;
                    });
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
      ),
    );
  }
}
