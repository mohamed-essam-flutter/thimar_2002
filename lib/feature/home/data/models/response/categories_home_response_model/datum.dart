class Datum {
  int? id;
  String? name;
  String? description;
  String? media;

  Datum({this.id, this.name, this.description, this.media});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        media: json['media'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'media': media,
      };
}
