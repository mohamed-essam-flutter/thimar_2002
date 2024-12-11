import 'datum.dart';

class ShowFaqsResponseModels {
  List<Datum>? data;
  String? status;
  String? message;

  ShowFaqsResponseModels({this.data, this.status, this.message});

  factory ShowFaqsResponseModels.fromJson(Map<String, dynamic> json) {
    return ShowFaqsResponseModels(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'status': status,
        'message': message,
      };
}
