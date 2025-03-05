/// QID : "6700829e0a5849a4aee16297"
/// Question : "Who is making the Web standards?"
/// inCorrectAnswer : "A3"
/// correctAnswer : "A4"
/// answers : {}
library;

class WrongQuestions {
  WrongQuestions({
    this.qid,
    this.question,
    this.inCorrectAnswer,
    this.correctAnswer,
    this.answers,
  });

  WrongQuestions.fromJson(dynamic json) {
    qid = json['QID'];
    question = json['Question'];
    inCorrectAnswer = json['inCorrectAnswer'];
    correctAnswer = json['correctAnswer'];
    answers = json['answers'];
  }
  String? qid;
  String? question;
  String? inCorrectAnswer;
  String? correctAnswer;
  dynamic answers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['QID'] = qid;
    map['Question'] = question;
    map['inCorrectAnswer'] = inCorrectAnswer;
    map['correctAnswer'] = correctAnswer;
    map['answers'] = answers;
    return map;
  }
}
