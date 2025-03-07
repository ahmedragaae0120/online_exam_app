import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';

class MultiChoiceAnswerWidget extends StatelessWidget {
  final String? answerText;
  final bool isSelected;
  final VoidCallback onSelect;
  const MultiChoiceAnswerWidget(
      {super.key,
      required this.answerText,
      required this.isSelected,
      required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(answerText ?? ""),
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      selected: isSelected,
      tileColor: Color(0xffEDEFF3),
      selectedTileColor: Color(0xffCCD7EB),
      selectedColor: AppColors.black_base,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      leading: Checkbox.adaptive(
        value: isSelected,
        onChanged: (value) => onSelect(),
      ),
      onTap: onSelect,
    );
  }
}
