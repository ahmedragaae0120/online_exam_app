import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/Shared/widgets/toast_message.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/data/model/Result/ResultModel.dart';
import 'package:online_exam_app/data/model/questions_response/Answers.dart';
import 'package:online_exam_app/data/model/questions_response/question.dart';
import 'package:online_exam_app/ui/exam_screen/widgets/answer_builder.dart';
import 'package:online_exam_app/ui/resultsScreen/VeiwModel/result_cubit.dart';
import 'package:online_exam_app/ui/resultsScreen/VeiwModel/result_intent.dart';

class AnswersScreen extends StatelessWidget {
  final ResultModel resultModel;

  AnswersScreen({required this.resultModel, super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = ResultCubit.get(context);

    return Scaffold(
      appBar: AppBar(title: Text("Answers")),
      body: BlocProvider(
        create: (context) =>
        getIt<ResultCubit>()
          ..doIntent(getResultByIdIntent(examId: resultModel.exam?.id ?? "")),
        child: BlocConsumer<ResultCubit, ResultState>(
          listener: (context, state) {
            if (state is GetResultByIdStateLoading) {
              showDialog(
                context: context,
                builder: (context) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.blue_base,
                  ),
                ),
              );
            }
            if (state is GetResultByIdStateError) {
              toastMessage(message: state.message, tybeMessage: TybeMessage.negative);
            }
          },
          builder: (context, state) {

            return Column(
              children: [
                // this is not answered questions
                Expanded(
                  child: ListView.builder(
                    itemCount: resultModel.questions?.where((q) =>
                    !(resultModel.correctQuestions?.any((cq) => cq?.qid == q.id) ?? false) &&
                        !(resultModel.wrongQuestions?.any((wq) => wq?.qid == q.id) ?? false)
                    ).length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      // Filter the unanswered questions
                      List<Question> unAnsweredQuestions = resultModel.questions?.where((q) =>
                      !(resultModel.correctQuestions?.any((cq) => cq.qid == q.id) ?? false) &&
                          !(resultModel.wrongQuestions?.any((wq) => wq.qid == q.id) ?? false)
                      ).toList() ?? [];
                  
                      // Get the question ID
                      String questionId = unAnsweredQuestions[index].id ?? "";
                  
                      return AnswerBuilder(
                        answerStatus: AnswerTypeStatus.Empty, // Since it's unanswered
                        answers: unAnsweredQuestions[index].answers ?? [],
                        answerType: AnswerType.single,
                        correctAnswerKey: unAnsweredQuestions[index].correct ?? '',
                        questionId: questionId,
                      );
                    },
                  ),
                ),
                // this is wrong answered questions
                Expanded(
                  child: ListView.builder(
                    itemCount: resultModel.wrongQuestions?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {

                      List<Question?> wrongAnsweredQuestions = resultModel.wrongQuestions
                          ?.map((wq) => resultModel.questions?.firstWhere(
                            (q) => q.id == wq?.qid,
                        orElse: () => Question(), // Default empty question if not found
                      ))
                          .where((q) => q?.id != null) // Remove empty questions
                          .toList() ?? [];


                      // Get the question ID
                      String questionId = wrongAnsweredQuestions[index]?.id ?? "";

                      return AnswerBuilder(
                        answerStatus: AnswerTypeStatus.Wrong, // Since it's unanswered
                        answers: wrongAnsweredQuestions[index]?.answers ?? [],
                        answerType: AnswerType.single,
                        correctAnswerKey: wrongAnsweredQuestions[index]?.correct ?? '',
                        questionId: questionId,
                      );
                    },
                  ),
                ),

                // this is Correct answered questions
                Expanded(
                  child: ListView.builder(
                    itemCount: resultModel.wrongQuestions?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {

                      List<Question?> wrongAnsweredQuestions = resultModel.correctQuestions
                          ?.map((wq) => resultModel.questions?.firstWhere(
                            (q) => q.id == wq.qid,
                        orElse: () => Question(), // Default empty question if not found
                      ))
                          .where((q) => q?.id != null) // Remove empty questions
                          .toList() ?? [];


                      // Get the question ID
                      String questionId = wrongAnsweredQuestions[index]?.id ?? "";

                      return AnswerBuilder(
                        answerStatus: AnswerTypeStatus.Correct, // Since it's unanswered
                        answers: wrongAnsweredQuestions[index]?.answers ?? [],
                        answerType: AnswerType.single,
                        correctAnswerKey: wrongAnsweredQuestions[index]?.correct ?? '',
                        questionId: questionId,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
