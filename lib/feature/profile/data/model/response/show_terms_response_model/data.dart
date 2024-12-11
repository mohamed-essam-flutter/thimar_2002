class Data {
  String? terms;

  Data({this.terms});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        terms: json['terms'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'terms': terms,
      };
}
