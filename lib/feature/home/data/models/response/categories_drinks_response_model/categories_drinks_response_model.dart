import 'links.dart';
import 'meta.dart';

class CategoriesDrinksResponseModel {
  List<dynamic>? data;
  Links? links;
  Meta? meta;
  String? status;
  String? message;

  CategoriesDrinksResponseModel({
    this.data,
    this.links,
    this.meta,
    this.status,
    this.message,
  });

  factory CategoriesDrinksResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoriesDrinksResponseModel(
      data: json['data'] as List<dynamic>?,
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      status: json['status'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data,
        'links': links?.toJson(),
        'meta': meta?.toJson(),
        'status': status,
        'message': message,
      };
}
