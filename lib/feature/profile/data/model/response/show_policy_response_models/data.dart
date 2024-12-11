class Data {
  String? policy;

  Data({this.policy});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        policy: json['policy'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'policy': policy,
      };
}
