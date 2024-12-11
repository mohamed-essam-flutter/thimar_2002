class City {
  String? id;
  String? name;

  City({this.id, this.name});

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
