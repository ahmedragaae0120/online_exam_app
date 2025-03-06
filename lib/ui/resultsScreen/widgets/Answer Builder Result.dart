import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/data/model/questions_response/Answers.dart';

import 'package:online_exam_app/ui/resultsScreen/widgets/Result%20Choice%20Widget.dart';

class ResultAnswerBuilder extends StatelessWidget {
  final List<Answer> answers;
  final ChoiceType questionType;
  final String correctAnswerKey; // المفتاح الصحيح للإجابة
  final String question;
  final String studentAnswerKey;

  const ResultAnswerBuilder({
    super.key,
    required this.studentAnswerKey,
    required this.questionType,
    required this.answers,
    required this.correctAnswerKey,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Card(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: (questionType == ChoiceType.empty)?AppColors.error:Colors.white, width: 1),
      ),
      color: (questionType == ChoiceType.empty)?AppColors.Light_Red:Colors.white,
      elevation: 6, // Adjust the elevation as needed
      margin: EdgeInsets.all(Config.screenWidth! * 0.02),
      child: Padding(
        padding: EdgeInsets.all(Config.screenWidth! * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: TextStyle(
                fontSize: Config.screenWidth! * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Config.screenHight! * 0.02),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: answers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String currentAnswer = answers[index].answer ?? '';
                return ResultChoiceWidget(
                  answerText: currentAnswer,
                  choiceType: (questionType == ChoiceType.empty)
                      ? ChoiceType.empty
                      : (answers[index].key == correctAnswerKey)
                      ? ChoiceType.correct
                      : (answers[index].key == studentAnswerKey)
                      ? ChoiceType.wrong
                      : ChoiceType.empty,

                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  Config.spaceSmall,
            ),
          ],
        ),
      ),
    );
  }
}
