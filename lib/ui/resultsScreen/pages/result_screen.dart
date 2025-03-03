import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/Shared/widgets/toast_message.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/services/user_service.dart';
import 'package:online_exam_app/ui/resultsScreen/VeiwModel/result_cubit.dart';
import 'package:online_exam_app/ui/resultsScreen/VeiwModel/result_intent.dart';
import 'package:online_exam_app/ui/resultsScreen/widgets/ExamCard.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final UserService userService = getIt<UserService>();

  String? get userId => userService.getCurrentUser()?.id;

  @override
  Widget build(BuildContext context) {
    final cubit = ResultCubit.get(context);

    return BlocProvider(
      create: (context) => getIt<ResultCubit>()..doIntent(GetResultsIntent()),
      child: BlocConsumer<ResultCubit, ResultState>(
        listener: (context, state) {
          if (state is GetResultsStateError) {
            print("${state.message}");
            toastMessage(
                message: state.message, tybeMessage: TybeMessage.negative);
          }

        },
        builder: (context, state) {
          if (state is DeleteResultStateSuccess) {
            cubit.doIntent(GetResultsIntent());
          }
          return Scaffold(
            appBar: AppBar(title: const Text("Results")),
            body: Column(
              children: [
                Expanded(
                  child: state is GetResultsStateSuccess
                      ? (state.result.isEmpty
                          ? const Center(
                              child: Text(
                                "No results available",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            )
                          : ListView.builder(
                              itemCount: state.result.length,
                              itemBuilder: (context, index) {
                                final result = state.result[index];
                                return ExamCard(
                                  onDelete: () {
                                    cubit.doIntent(deleteResultIntent(
                                      userId: userId ?? "",
                                      id: result.examId ?? "",
                                    ));
                                    setState(() {});
                                  },
                                  result: result,
                                );
                              },
                            ))
                      : const Center(child: CircularProgressIndicator()),
                ),
                // Static Button at the Bottom
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      "Add Result",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
