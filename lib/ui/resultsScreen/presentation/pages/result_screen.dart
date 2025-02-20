import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/data/model/ResultModel.dart';
import 'package:online_exam_app/ui/resultsScreen/presentation/VeiwModel/result_cubit.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResultCubit, ResultState>(
      listener: (context, state) {
        if (state is GetResultsStateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Results fetched successfully! ✅")),
          );
        } else if (state is GetResultsStateError) {
          print("Error: ${state.message}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${state.message}")),
          );
        } else if (state is AddResultStateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Result added successfully! 🎉")),
          );
        } else if (state is AddResultStateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${state.message} ❌")),
          );
        }
      },
      child: BlocBuilder<ResultCubit, ResultState>(
        builder: (context, state) {
          return Column(
            children: [
              if (state is GetResultsStateLoading || state is AddResultStateLoading)
                const CircularProgressIndicator(),
              IconButton(
                onPressed: () async {
                  final cubit = context.read<ResultCubit>();

                  ResultModel exam = ResultModel(
                    examId: "5",
                    message: "daada",
                    studentAnswers: [
                      Answers(answer: "A", key: "A2"),
                      Answers(answer: "b", key: "A22"),
                      Answers(answer: "aadaA", key: "A422"),
                      Answers(answer: "addad", key: "A24"),
                      Answers(answer: "Aadada", key: "A223"),
                    ],
                    exam: Exam(
                      sId: "1",
                      active: true,
                      numberOfQuestions: 5,
                      subject: "cmjos",
                      title: "good life",
                    ),
                    subject: Subject(name: "dnasji"),
                    numOfCorrectAnswers: 5,
                    questions: null,
                  );

                  await cubit.addResult(exam);

                  await cubit.GetResults();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          );
        },
      ),
    );
  }
}
