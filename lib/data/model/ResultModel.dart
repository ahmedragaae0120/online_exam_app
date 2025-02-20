import 'dart:convert';

class ResultModel {
  String? examId;
  String? message;
  int? numOfCorrectAnswers;
  List<Answers>? studentAnswers;
  List<Questions>? questions;
  Subject? subject;
  Exam? exam;

  ResultModel(
      {this.examId,
      this.studentAnswers,
      this.exam,
      this.subject,
      this.message,
      this.questions,
      this.numOfCorrectAnswers});

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      examId: json['examId'],
      studentAnswers: json['studentAnswers'] != null
          ? List<Answers>.from(jsonDecode(json['studentAnswers'])
                  ?.map((x) => Answers.fromJson(x)) ??
              [])
          : [],
      numOfCorrectAnswers: json['numOfCorrectAnswers'],
      message: json['message'],
      subject: json['subject'] != null
          ? Subject.fromJson(jsonDecode(json['subject']))
          : null,
      exam:
          json['exam'] != null ? Exam.fromJson(jsonDecode(json['exam'])) : null,
      questions: json['questions'] != null && json['questions'] != "null"
          ? List<Questions>.from((jsonDecode(json['questions']) ?? [])
              .map((x) => Questions.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'examId': examId,
      'studentAnswers':
          jsonEncode(studentAnswers?.map((x) => x.toJson()).toList()),
      'subject': jsonEncode(subject?.toJson()),
      'questions': jsonEncode(questions?.map((x) => x.toJson()).toList()),
      'numOfCorrectAnswers': numOfCorrectAnswers,
      'message': message,
    };
  }
}
class Questions {
  List<Answers>? answers;
  String? type;
  String? sId;
  String? question;
  String? correct;
  String? createdAt;

  Questions(
      {this.answers,
      this.type,
      this.sId,
      this.question,
      this.correct,
      this.createdAt});

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      answers: json['answers'] != null
          ? List<Answers>.from(json['answers'].map((x) => Answers.fromJson(x)))
          : [],
      type: json['type'],
      sId: json['_id'],
      question: json['question'],
      correct: json['correct'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answers': answers?.map((x) => x.toJson()).toList(),
      'type': type,
      '_id': sId,
      'question': question,
      'correct': correct,
      'createdAt': createdAt,
    };
  }
}

class Answers {
  String? answer;
  String? key;

  Answers({this.answer, this.key});

  factory Answers.fromJson(Map<String, dynamic> json) {
    return Answers(
      answer: json['answer'],
      key: json['key'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'key': key,
    };
  }
}

class Subject {
  String? sId;
  String? name;
  String? icon;
  String? createdAt;

  Subject({this.sId, this.name, this.icon, this.createdAt});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      sId: json['_id'],
      name: json['name'],
      icon: json['icon'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'name': name,
      'icon': icon,
      'createdAt': createdAt,
    };
  }
}

class Exam {
  String? sId;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  String? createdAt;

  Exam(
      {this.sId,
      this.title,
      this.duration,
      this.subject,
      this.numberOfQuestions,
      this.active,
      this.createdAt});

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      sId: json['_id'],
      title: json['title'],
      duration: json['duration'],
      subject: json['subject'],
      numberOfQuestions: json['numberOfQuestions'],
      active: json['active'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'title': title,
      'duration': duration,
      'subject': subject,
      'numberOfQuestions': numberOfQuestions,
      'active': active,
      'createdAt': createdAt,
    };
  }
}
