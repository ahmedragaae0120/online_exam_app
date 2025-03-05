import 'WrongQuestions.dart';
import 'CorrectQuestions.dart';

/// message : "success"
/// correct : 1
/// wrong : 1
/// total : "50%"
/// WrongQuestions : [{"QID":"6700829e0a5849a4aee16297","Question":"Who is making the Web standards?","inCorrectAnswer":"A3","correctAnswer":"A4","answers":{}}]
/// correctQuestions : [{"QID":"670082800a5849a4aee16294","Question":"What does HTML stand for?","correctAnswer":"A2","answers":{}}]

class QuestionResultResponse {
  QuestionResultResponse({
      this.message, 
      this.correct, 
      this.wrong, 
      this.total, 
      this.wrongQuestions, 
      this.correctQuestions,});

  QuestionResultResponse.fromJson(dynamic json) {
    message = json['message'];
    correct = json['correct'];
    wrong = json['wrong'];
    total = json['total'];
    if (json['WrongQuestions'] != null) {
      wrongQuestions = [];
      json['WrongQuestions'].forEach((v) {
        wrongQuestions?.add(WrongQuestions.fromJson(v));
      });
    }
    if (json['correctQuestions'] != null) {
      correctQuestions = [];
      json['correctQuestions'].forEach((v) {
        correctQuestions?.add(CorrectQuestions.fromJson(v));
      });
    }
  }
  String? message;
  num? correct;
  num? wrong;
  String? total;
  List<WrongQuestions>? wrongQuestions;
  List<CorrectQuestions>? correctQuestions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['correct'] = correct;
    map['wrong'] = wrong;
    map['total'] = total;
    if (wrongQuestions != null) {
      map['WrongQuestions'] = wrongQuestions?.map((v) => v.toJson()).toList();
    }
    if (correctQuestions != null) {
      map['correctQuestions'] = correctQuestions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}