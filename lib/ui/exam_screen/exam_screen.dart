import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:online_exam_app/Shared/widgets/custom_button.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/utils/assets_manager.dart';
import 'package:online_exam_app/core/utils/config.dart';
import 'package:online_exam_app/core/utils/string_manager.dart';
import 'package:online_exam_app/core/utils/text_style_manger.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/LinearProgress_custom.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/answer_builder.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/single_choice_answer_widget.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/next&back_customButton.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/summary_exam_screen.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  List<String> questions = [
    "السؤال الاول",
    "السؤال الثاني",
    "السؤال الثالث",
    "السؤال الرابع",
    "السؤال الخامس",
    "السؤال السادس",
    "السؤال السابع",
    "السؤال الثامن",
    "السؤال التاسع",
    "السؤال العاشر",
  ];
  List<String> answers = ["احمد", "على", "حسام", "مروان"];
  String? selectedAnswer;
  int quesionCurrent = 1;
  int date = 10;
  late DateTime endTime;
  @override
  void initState() {
    super.initState();
    endTime = DateTime.now().add(Duration(seconds: date));
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Exam",
        ),
        actions: [
          Row(
            spacing: 5,
            children: [
              Image.asset(AssetsManager.resourceClock),
              TimerCountdown(
                enableDescriptions: false,
                format: CountDownTimerFormat.minutesSeconds,
                timeTextStyle: AppTextStyle.semiBold20.copyWith(
                  color: AppColors.success,
                ),
                endTime: endTime,
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text(
              "Question $quesionCurrent of ${questions.length}",
              textAlign: TextAlign.center,
              style: AppTextStyle.medium14.copyWith(color: AppColors.grey),
            ),
            LinearProgressCustom(
              quesionCurrent: quesionCurrent,
              totalQuestions: questions.length,
            ),
            Config.spaceSmall,
            Flexible(
              child: Text(
                questions[quesionCurrent - 1],
                style: AppTextStyle.medium18,
              ),
            ),
            Config.spaceSmall,
            AnswerBuilder(
              answers: answers,
              answerType: AnswerType.multiple,
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                spacing: 16,
                children: [
                  Expanded(
                    child: OutlinedFilledButton(
                        text: "Back",
                        onTap: () {
                          if (quesionCurrent <= questions.length &&
                              quesionCurrent > 1) {
                            setState(() {
                              quesionCurrent--;
                            });
                          }
                        },
                        borderSide: true),
                  ),
                  Expanded(
                    child: OutlinedFilledButton(
                        text: quesionCurrent == questions.length
                            ? "Submit"
                            : "Next",
                        onTap: () {
                          if (quesionCurrent == questions.length) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SummaryExamScreen(
                                  conrrectAnswers: 10,
                                  inConrrectAnswers: 0,
                                ),
                              ),
                            );
                          }
                          if (quesionCurrent < questions.length) {
                            setState(() {
                              quesionCurrent++;
                            });
                          }
                        },
                        borderSide: false),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
