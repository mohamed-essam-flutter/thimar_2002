import 'datum.dart';
import 'links.dart';
import 'meta.dart';

class CategoriesVegetablesResponseModel {
  List<Datum>? data;
  Links? links;
  Meta? meta;
  String? status;
  String? message;

  CategoriesVegetablesResponseModel({
    this.data,
    this.links,
    this.meta,
    this.status,
    this.message,
  });

  factory CategoriesVegetablesResponseModel.fromJson(
      Map<String, dynamic> json) {
    return CategoriesVegetablesResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
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
        'data': data?.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'meta': meta?.toJson(),
        'status': status,
        'message': message,
      };
}