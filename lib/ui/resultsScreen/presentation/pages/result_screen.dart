import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/Shared/widgets/toast_message.dart';
import 'package:online_exam_app/core/Di/di.dart';
import 'package:online_exam_app/core/services/user_service.dart';
import 'package:online_exam_app/data/model/ResultModel.dart';
import 'package:online_exam_app/ui/resultsScreen/presentation/VeiwModel/result_cubit.dart';
import 'package:online_exam_app/ui/resultsScreen/presentation/widgets/ExamCard.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});

  final UserService userService = getIt<UserService>();

  String? get userId => userService.getCurrentUser()?.id;

  @override
  Widget build(BuildContext context) {
    final cubit = ResultCubit.get(context);

    return BlocProvider(
      create: (context) => getIt<ResultCubit>()..GetResults(),
      child: BlocConsumer<ResultCubit, ResultState>(
        listener: (context, state) {
          if (state is GetResultsStateError) {
            print("${state.message}😘😘😘😘");
            toastMessage(
                message: state.message, tybeMessage: TybeMessage.negative);
          } else if (state is AddResultStateError) {
            toastMessage(
                message: state.message, tybeMessage: TybeMessage.negative);
          }
        },
        builder: (context, state) {
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
                                    cubit.deleteResult(
                                        userId ?? "", result.examId ?? "");
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
                    onPressed: () {
                      ResultModel result = ResultModel(
                        examId: "670070a830a3c3c1944a9c63",
                        message: "success",
                        studentAnswers: [
                          Answers(
                              answer: "Hyperlinks and Text Markup Language",
                              key: "A1"),
                          Answers(
                              answer: "Hyper Text Markup Language", key: "A2"),
                          Answers(
                              answer: "Home Tool Markup Language", key: "A3"),
                        ],
                        exam: Exam(
                          duration: 40,
                          sId: "670070a830a3c3c1944a9c63",
                          active: true,
                          numberOfQuestions: 40,
                          subject: "670037f6728c92b7fdf434fc",
                          title: "HTML Quiz",
                        ),
                        subject: Subject(name: "HTML"),
                        numOfCorrectAnswers: 564,
                        questions: [
                          Questions(
                            sId: "1",
                            question: "What does HTML stand for?",
                            correct: "Hyper Text Markup Language",
                            answers: [
                              Answers(
                                  answer: "Hyperlinks and Text Markup Language",
                                  key: "A1"),
                              Answers(
                                  answer: "Hyper Text Markup Language",
                                  key: "A2"),
                              Answers(
                                  answer: "Home Tool Markup Language",
                                  key: "A3"),
                            ],
                            type: "MCQ",
                            createdAt: DateTime.now().toString(),
                          ),
                          Questions(
                            sId: "2",
                            question: "Who is making the Web standards?",
                            correct: "The World Wide Web Consortium",
                            answers: [
                              Answers(answer: "Microsoft", key: "A1"),
                              Answers(answer: "Google", key: "A2"),
                              Answers(answer: "Mozilla", key: "A3"),
                              Answers(
                                  answer: "The World Wide Web Consortium",
                                  key: "A4"),
                            ],
                            type: "MCQ",
                            createdAt: DateTime.now().toString(),
                          ),
                          Questions(
                            sId: "3",
                            question:
                                "Choose the correct HTML element for the largest heading",
                            correct: "<h1>",
                            answers: [
                              Answers(answer: "<head>", key: "A1"),
                              Answers(answer: "<heading>", key: "A2"),
                              Answers(answer: "<h1>", key: "A3"),
                              Answers(answer: "<h6>", key: "A4"),
                            ],
                            type: "MCQ",
                            createdAt: DateTime.now().toString(),
                          ),
                          Questions(
                            sId: "4",
                            question:
                                "What is the correct HTML element for inserting a line break?",
                            correct: "<br>",
                            answers: [
                              Answers(answer: "<br>", key: "A1"),
                              Answers(answer: "<lb>", key: "A2"),
                              Answers(answer: "<break>", key: "A3"),
                              Answers(answer: "<pre>", key: "A4"),
                            ],
                            type: "MCQ",
                            createdAt: DateTime.now().toString(),
                          ),
                          Questions(
                            sId: "5",
                            question:
                                "What is the correct HTML for adding a background color?",
                            correct: "<body style='background-color:yellow;'>",
                            answers: [
                              Answers(
                                  answer:
                                      "<body style='background-color:yellow;'>",
                                  key: "A1"),
                              Answers(answer: "<body bg='yellow'>", key: "A2"),
                              Answers(
                                  answer: "<background>yellow</background>",
                                  key: "A3"),
                              Answers(
                                  answer: "<yellow>yellow</yellow>", key: "A4"),
                            ],
                            type: "MCQ",
                            createdAt: DateTime.now().toString(),
                          ),
                          Questions(
                            sId: "6",
                            question:
                                "Choose the correct HTML element to define important text",
                            correct: "<strong>",
                            answers: [
                              Answers(answer: "<important>", key: "A1"),
                              Answers(answer: "<i>", key: "A2"),
                              Answers(answer: "<b>", key: "A3"),
                              Answers(answer: "<strong>", key: "A4"),
                            ],
                            type: "MCQ",
                            createdAt: DateTime.now().toString(),
                          ),
                          Questions(
                            sId: "7",
                            question:
                                "Choose the correct HTML element to define emphasized text",
                            correct: "<em>",
                            answers: [
                              Answers(answer: "<em>", key: "A1"),
                              Answers(answer: "<italic>", key: "A2"),
                              Answers(answer: "<i>", key: "A3"),
                              Answers(answer: "<strong>", key: "A4"),
                            ],
                            type: "MCQ",
                            createdAt: DateTime.now().toString(),
                          ),
                          Questions(
                            sId: "8",
                            question:
                                "What is the correct HTML for creating a hyperlink?",
                            correct:
                                "<a href='http://www.w3schools.com'>W3Schools</a>",
                            answers: [
                              Answers(
                                  answer:
                                      "<a href='http://www.w3schools.com'>W3Schools</a>",
                                  key: "A1"),
                              Answers(
                                  answer: "<a>http://www.w3schools.com</a>",
                                  key: "A2"),
                              Answers(
                                  answer:
                                      "<a url='http://www.w3schools.com'>W3Schools.com</a>",
                                  key: "A3"),
                              Answers(
                                  answer:
                                      "<a name='http://www.w3schools.com'>W3Schools.com</a>",
                                  key: "A4"),
                            ],
                            type: "MCQ",
                            createdAt: DateTime.now().toString(),
                          ),
                          Questions(
                            sId: "9",
                            question:
                                "Which character is used to indicate an end tag?",
                            correct: "/",
                            answers: [
                              Answers(answer: "/", key: "A1"),
                              Answers(answer: "*", key: "A2"),
                              Answers(answer: "<", key: "A3"),
                              Answers(answer: "~", key: "A4"),
                            ],
                            type: "MCQ",
                            createdAt: DateTime.now().toString(),
                          ),
                          Questions(
                            sId: "10",
                            question:
                                "How can you open a link in a new tab/browser window?",
                            correct: "<a href='url' target='_blank'>",
                            answers: [
                              Answers(answer: "<a href='url' new>", key: "A1"),
                              Answers(
                                  answer: "<a href='url' target='new'>",
                                  key: "A2"),
                              Answers(
                                  answer: "<a href='url' target='_blank'>",
                                  key: "A3"),
                            ],
                            type: "MCQ",
                            createdAt: DateTime.now().toString(),
                          ),
                        ],
                      );
                      print("📌 JSON to Store: ${jsonEncode(result.toJson())}");
                      cubit.addResult(result);
                    },
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
