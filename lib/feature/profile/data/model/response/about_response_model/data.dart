class Data {
  String? about;

  Data({this.about});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        about: json['about'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'about': about,
      };
}
