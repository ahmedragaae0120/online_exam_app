import 'package:flutter/material.dart';

class LinearProgressCustom extends StatelessWidget {
  final int quesionCurrent;
  final int totalQuestions;
  const LinearProgressCustom({
    super.key,
    required this.quesionCurrent,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    double progress = quesionCurrent / totalQuestions;

    return LinearProgressIndicator(
      value: progress,
      // semanticsLabel: widget.questionText ?? "",
      // semanticsValue: widget.questionText ?? "",
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(100),
      ),
    );
  }
}
