import 'dart:convert';

import 'package:online_exam_app/data/model/questions_response/exam.dart';
import 'package:online_exam_app/data/model/questions_response/question.dart';
import 'package:online_exam_app/data/model/questions_response/subject.dart';

import '../questions_response/Answers.dart';

class ResultModel {
  String? examId;
  String? message;
  int? numOfCorrectAnswers;
  final Map<String, Answer?>? selectedAnswersMap;
  List<Question>? questions;
  Subject? subject;
  Exam? exam;

  ResultModel({
    this.examId,
    this.selectedAnswersMap,
    this.exam,
    this.subject,
    this.message,
    this.questions,
    this.numOfCorrectAnswers,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      examId: json['examId'],
      message: json['message'],
      numOfCorrectAnswers: json['numOfCorrectAnswers'],
      selectedAnswersMap: json['studentAnswers'] != null
          ? Map<String, Answer>.from(
        (json['studentAnswers'] is String
            ? jsonDecode(json['studentAnswers']) // Decode only if it's a String
            : json['studentAnswers'])
            .map((key, value) => MapEntry(key, Answer.fromJson(value))),
      )
          : null,
      questions: json['questions'] != null
          ? List<Question>.from(
        (json['questions'] is String
            ? jsonDecode(json['questions']) // Decode only if it's a String
            : json['questions'])
            .map((x) => Question.fromJson(x)),
      )
          : null,
      subject: json['subject'] != null
          ? Subject.fromJson(json['subject'] is String ? jsonDecode(json['subject']) : json['subject'])
          : null,
      exam: json['exam'] != null
          ? Exam.fromJson(json['exam'] is String ? jsonDecode(json['exam']) : json['exam'])
          : null,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'examId': examId,
      'studentAnswers': selectedAnswersMap != null
          ? jsonEncode(
        selectedAnswersMap!.map(
              (key, value) => MapEntry(key, value?.toJson()),
        ),
      )
          : null,
      'subject': subject?.toJson(),
      'questions': questions?.map((x) => x.toJson()).toList(),
      'numOfCorrectAnswers': numOfCorrectAnswers,
      'message': message,
      'exam': exam?.toJson(),
    };
  }
}