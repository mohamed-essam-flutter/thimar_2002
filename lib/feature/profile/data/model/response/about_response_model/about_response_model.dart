import 'data.dart';

class AboutResponseModel {
  Data? data;
  String? status;
  String? message;

  AboutResponseModel({this.data, this.status, this.message});

  factory AboutResponseModel.fromJson(Map<String, dynamic> json) {
    return AboutResponseModel(
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
