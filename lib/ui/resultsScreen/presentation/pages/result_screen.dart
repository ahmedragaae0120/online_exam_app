import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/ui/resultsScreen/presentation/VeiwModel/result_cubit.dart';
import 'package:online_exam_app/ui/resultsScreen/presentation/widgets/ExamCard.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ResultCubit>()..GetResults(),
      child: BlocConsumer<ResultCubit, ResultState>(
        listener: (context, state) {
          if (state is GetResultsStateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Results fetched successfully! ✅")),
            );
          } else if (state is GetResultsStateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.message} ❌")),
            );
          } else if (state is AddResultStateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Result added successfully! 🎉")),
            );
          } else if (state is AddResultStateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.message} ❌")),
            );
          }
        },
        builder: (context, state) {
          if (state is GetResultsStateSuccess) {
            return ListView.builder(
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                final result = state.result[index];
                return ExamCard(exam: result);
              },
            );
          }
          return const Center(child: Text("No results available"));
        },
      ),
    );
  }
}
