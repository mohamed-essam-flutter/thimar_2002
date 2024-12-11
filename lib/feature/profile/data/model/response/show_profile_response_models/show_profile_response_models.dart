import 'data.dart';

class ShowProfileResponseModels {
  Data? data;
  String? status;
  String? message;

  ShowProfileResponseModels({this.data, this.status, this.message});

  factory ShowProfileResponseModels.fromJson(Map<String, dynamic> json) {
    return ShowProfileResponseModels(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'status': status,
        'message': message,
      };
}
