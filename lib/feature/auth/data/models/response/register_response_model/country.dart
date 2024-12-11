class Country {
  String? id;
  String? name;
  String? nationality;
  String? key;
  String? flag;

  Country({this.id, this.name, this.nationality, this.key, this.flag});

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json['id'] as String?,
        name: json['name'] as String?,
        nationality: json['nationality'] as String?,
        key: json['key'] as String?,
        flag: json['flag'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'nationality': nationality,
        'key': key,
        'flag': flag,
      };
}
