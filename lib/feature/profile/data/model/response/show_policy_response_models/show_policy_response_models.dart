import 'data.dart';

class ShowPolicyResponseModels {
  Data? data;
  String? status;
  String? message;

  ShowPolicyResponseModels({this.data, this.status, this.message});

  factory ShowPolicyResponseModels.fromJson(Map<String, dynamic> json) {
    return ShowPolicyResponseModels(
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
