import 'question.dart';

class QuestionResponse {
  String? message;
  List<Question>? questions;

  QuestionResponse({this.message, this.questions});

  factory QuestionResponse.fromJson(Map<String, dynamic> json) {
    return QuestionResponse(
      message: json['message'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'questions': questions?.map((e) => e.toJson()).toList(),
      };
}
