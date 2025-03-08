import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/Shared/widgets/toast_message.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/ui/resultsScreen/VeiwModel/result_cubit.dart';
import 'package:online_exam_app/ui/resultsScreen/VeiwModel/result_intent.dart';
import 'package:online_exam_app/ui/resultsScreen/widgets/ExamCard.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ResultCubit>(
        context); // Ensure cubit is provided before use

    return BlocConsumer<ResultCubit, ResultState>(
      listener: (context, state) {
        if (state is GetResultsStateError) {
          toastMessage(
              message: state.message, tybeMessage: TybeMessage.negative);
        }
        if (state is DeleteResultStateSuccess) {
          cubit.doIntent(GetResultsIntent()); // Refresh results after deletion
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Results")),
          body: state is GetResultsStateSuccess
              ? state.result.isNotEmpty
                  ? _buildGroupedResults(state.result, cubit)
                  : _buildNoResultsMessage() // Show message when no results exist
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildGroupedResults(List<ResultModel> results, ResultCubit cubit) {
    final Map<String, List<ResultModel>> groupedResults = {};

    for (var result in results) {
      final subjectName = result.subject?.name ?? "Unknown";
      groupedResults.putIfAbsent(subjectName, () => []).add(result);
    }

    return ListView(
      children: groupedResults.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                entry.key,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ...entry.value.map((result) => BlocProvider.value(
                  value: cubit,
                  child: ExamCard(
                    onDelete: () {
                      cubit.doIntent(
                          deleteResultIntent(examId: result.examId ?? ""));
                    },
                    result: result,
                  ),
                )),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildNoResultsMessage() {
    return const Center(
      child: Text(
        "No results available",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
