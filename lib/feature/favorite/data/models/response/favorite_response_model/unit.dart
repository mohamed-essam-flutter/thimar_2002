class Unit {
  int? id;
  String? name;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;

  Unit({this.id, this.name, this.type, this.createdAt, this.updatedAt});

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json['id'] as int?,
        name: json['name'] as String?,
        type: json['type'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
