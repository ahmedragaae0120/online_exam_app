import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';

enum ChoiceType { wrong, correct, empty }

class ResultChoiceWidget extends StatelessWidget {
  final String? answerText;
  final ChoiceType choiceType;

  const ResultChoiceWidget({
    super.key,
    required this.choiceType,
    required this.answerText,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the background and border color based on `isAnswerFalse`
    Color? backgroundColor;
    Color borderColor = Colors.transparent;

    if (choiceType == ChoiceType.wrong) {
      backgroundColor = AppColors.Light_Red; // Correct answer
      borderColor = AppColors.error;
    } else if (choiceType == ChoiceType.correct) {
      backgroundColor = AppColors.Light_Green; // Correct answer
      borderColor = AppColors.success;
    } else if (choiceType == ChoiceType.empty) {
      backgroundColor = null; // Correct answer
      borderColor = Colors.transparent;
    }

    return AbsorbPointer(
      child: ListTile(
        leading: (choiceType == ChoiceType.empty)
            ? Checkbox(
                value: false,
                onChanged: null,
                side: BorderSide(color: AppColors.blue_base),
              )
            : Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: _getBackgroundColor(choiceType),
                    border: Border.all(
                      color: _getBackgroundColor(choiceType),
                    )),
                child: Icon(
                    size: 18,
                    choiceType == ChoiceType.correct
                        ? Icons.check
                        : Icons.close,
                    color: Colors.white),
              ),
        title: Text(answerText ?? ""),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        tileColor: backgroundColor ?? const Color(0xffEDEFF3),
        selectedTileColor: const Color(0xffCCD7EB),
        selectedColor: AppColors.black_base,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 2.0), // Apply the border
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Color _getBackgroundColor(ChoiceType choiceType) {
    return choiceType == ChoiceType.correct
        ? AppColors.success
        : AppColors.error;
  }
}
