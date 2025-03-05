import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/answer_builder.dart';

class SingleChoiceAnswerWidget extends StatelessWidget {
  final String? answerText;
  final bool isSelected;
  final AnswerTypeStatus? answerStatus;
  final VoidCallback onSelect;

  SingleChoiceAnswerWidget({
    super.key,
    this.answerStatus,
    required this.answerText,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the background and border color based on `isAnswerFalse`
    Color? backgroundColor;
    Color borderColor=Colors.transparent;

    if (answerStatus == AnswerTypeStatus.Wrong) {
      backgroundColor = AppColors.Light_Red; // Correct answer
      borderColor = AppColors.error;
    } else if (answerStatus == AnswerTypeStatus.Correct) {
      backgroundColor = AppColors.Light_Green; // Correct answer
      borderColor = AppColors.success;
    }
    else if (answerStatus == AnswerTypeStatus.Empty) {
      backgroundColor=null; // Correct answer
      borderColor=Colors.transparent;
    }

    bool disableInteraction = answerStatus != null;
    // Disable tap if not null

    return AbsorbPointer(
      absorbing: disableInteraction, // Disables all interactions when true
      child: ListTile(
        title: Text(answerText ?? ""),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        selected: isSelected,
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
        leading: Radio<String?>(
          value: answerText,
          groupValue: isSelected ? answerText : null,
          onChanged: disableInteraction ? null : (String? value) => onSelect(),
        ),

        onTap: disableInteraction ? null : onSelect, // Disable tap if needed
      ),
    );
  }
}
