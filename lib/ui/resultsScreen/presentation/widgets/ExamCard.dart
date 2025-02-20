import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/data/model/ResultModel.dart';

class ExamCard extends StatelessWidget {
  ResultModel exam;

  ExamCard({required this.exam, super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.network(exam.subject?.icon??""),
          Column(children: [
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(exam.exam?.title ?? ""),
                    Text("${exam.exam?.duration.toString() ?? ""} Minutes")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(exam.exam?.numberOfQuestions
                            .toString() ??
                        "")
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                        "${exam.numOfCorrectAnswers.toString()} Correct of  / ${exam.exam?.numberOfQuestions.toString()}"),
                  ],
                ),
              ],
            )
          ])
        ],
      ),
    );
  }
}
