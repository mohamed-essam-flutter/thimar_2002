class Datum {
  int? id;
  String? media;

  Datum({this.id, this.media});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        media: json['media'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'media': media,
      };
}
