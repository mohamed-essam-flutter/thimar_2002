class ProductEvaluationItem {
  int? value;
  String? comment;
  String? clientName;
  String? clientImage;

  ProductEvaluationItem(
      {this.value, this.comment, this.clientName, this.clientImage});

  factory ProductEvaluationItem.fromJson(Map<String, dynamic> json) =>
      ProductEvaluationItem(
        value: json['value'] as int?,
        comment: json['comment'] as String?,
        clientName: json['client_name'] as String?,
        clientImage: json['client_image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'comment': comment,
        'client_name': clientName,
        'client_image': clientImage,
      };
}
