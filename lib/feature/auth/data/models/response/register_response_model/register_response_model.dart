import 'data.dart';

class RegisterResponseModel {
  Data? data;
  String? status;
  String? message;

  RegisterResponseModel({this.data, this.status, this.message});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
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
