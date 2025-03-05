import 'dart:convert';
import 'package:online_exam_app/data/model/questions_response/exam.dart';
import 'package:online_exam_app/data/model/questions_response/qestions_result_response/CorrectQuestions.dart';
import 'package:online_exam_app/data/model/questions_response/qestions_result_response/WrongQuestions.dart';
import 'package:online_exam_app/data/model/questions_response/question.dart';
import 'package:online_exam_app/data/model/questions_response/subject.dart';

class ResultModel {
  String? examId;
  String? message;
  Map<String, String?>? selectedAnswersMap;
  List<Question>? questions;
  List<CorrectQuestions>? correctQuestions;
  List<WrongQuestions>? wrongQuestions;
  Subject? subject;
  Exam? exam;

  ResultModel({
    this.examId,
    this.message,
    this.selectedAnswersMap,
    this.questions,
    this.correctQuestions,
    this.wrongQuestions,
    this.subject,
    this.exam,
  });

  // Convert ResultModel to JSON with encoding for nested objects
  Map<String, dynamic> toJson() {
    return {
      'examId': examId,
      'message': message,
      'studentAnswers': jsonEncode(selectedAnswersMap),
      'questions': jsonEncode(questions?.map((q) => q.toJson()).toList()),
      'correctQuestions':
          jsonEncode(correctQuestions?.map((q) => q.toJson()).toList()),
      'wrongQuestions':
          jsonEncode(wrongQuestions?.map((q) => q.toJson()).toList()),
      'subject': jsonEncode(subject?.toJson()),
      'exam': jsonEncode(exam?.toJson()),
    };
  }

  // Convert JSON from database to ResultModel with decoding for nested objects
  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      examId: json['examId'],
      message: json['message'],
      selectedAnswersMap: json['studentAnswers'] != null
          ? Map<String, String?>.from(jsonDecode(json['studentAnswers']))
          : null,
      questions: json['questions'] != null
          ? List<Question>.from(
              (jsonDecode(json['questions']) as List)
                  .map((x) => Question.fromJson(x)),
            )
          : null,
      correctQuestions: json['correctQuestions'] != null
          ? List<CorrectQuestions>.from(
              (jsonDecode(json['correctQuestions']) as List)
                  .map((x) => CorrectQuestions.fromJson(x)),
            )
          : null,
      wrongQuestions: json['wrongQuestions'] != null
          ? List<WrongQuestions>.from(
              (jsonDecode(json['wrongQuestions']) as List)
                  .map((x) => WrongQuestions.fromJson(x)),
            )
          : null,
      subject: json['subject'] != null
          ? Subject.fromJson(jsonDecode(json['subject']))
          : null,
      exam:
          json['exam'] != null ? Exam.fromJson(jsonDecode(json['exam'])) : null,
    );
  }
}
