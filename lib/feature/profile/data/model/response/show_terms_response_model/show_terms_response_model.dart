import 'data.dart';

class ShowTermsResponseModel {
  Data? data;
  String? status;
  String? message;

  ShowTermsResponseModel({this.data, this.status, this.message});

  factory ShowTermsResponseModel.fromJson(Map<String, dynamic> json) {
    return ShowTermsResponseModel(
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
