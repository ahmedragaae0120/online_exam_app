class Answer {
  String? answer;
  String? key;

  Answer({required this.answer, required this.key});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      answer: json['answer'] as String?,
      key: json['key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'key': key,
    };
  }
}
