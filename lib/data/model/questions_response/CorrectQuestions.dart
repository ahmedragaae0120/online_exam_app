/// QID : "670082800a5849a4aee16294"
/// Question : "What does HTML stand for?"
/// correctAnswer : "A2"
/// answers : {}

class CorrectQuestions {
  CorrectQuestions({
      this.qid, 
      this.question, 
      this.correctAnswer, 
      this.answers,});

  CorrectQuestions.fromJson(dynamic json) {
    qid = json['QID'];
    question = json['Question'];
    correctAnswer = json['correctAnswer'];
    answers = json['answers'];
  }
  String? qid;
  String? question;
  String? correctAnswer;
  dynamic answers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['QID'] = qid;
    map['Question'] = question;
    map['correctAnswer'] = correctAnswer;
    map['answers'] = answers;
    return map;
  }

}