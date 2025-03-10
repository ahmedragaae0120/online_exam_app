import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utils/assets_manager.dart';
import 'package:online_exam_app/ui/exam_screen/view/summary_exam_screen.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_cubit.dart';
import 'package:online_exam_app/ui/exam_screen/view_model/questions_intent.dart';

void showTimeoutDialog(BuildContext context, QuestionsCubit cubit) {
  showDialog(
    context: context,
    barrierDismissible: false, // المستخدم لا يمكنه إغلاقه بالضغط خارج النافذة
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 289,
          height: 230,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsManager.resourceSandClock,
                width: 60,
                height: 60,
              ),
              const SizedBox(height: 10),
              const Text(
                'Time out !!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: cubit..doIntent(CheckAnswersIntent()),
                        child: SummaryExamScreen(
                          countOfQuestions: cubit.countOfQuestions,
                        ),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'View score',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
