class Datum {
  int? id;
  String? question;
  String? answer;

  Datum({this.id, this.question, this.answer});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        question: json['question'] as String?,
        answer: json['answer'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'question': question,
        'answer': answer,
      };
}
