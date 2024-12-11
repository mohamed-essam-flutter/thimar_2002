import 'datum.dart';
import 'links.dart';
import 'meta.dart';

class HomeResponseModel {
  List<ProductDetailModels> data;
  Links? links;
  Meta? meta;
  String? status;
  String? message;
  int? userCartCount;
  int? maxPrice;
  double? minPrice;

  HomeResponseModel({
    required this.data,
    this.links,
    this.meta,
    this.status,
    this.message,
    this.userCartCount,
    this.maxPrice,
    this.minPrice,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeResponseModel(
      data: ((json['data'] ?? []) as List<dynamic>)
          .map((e) => ProductDetailModels.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      status: json['status'] as String?,
      message: json['message'] as String?,
      userCartCount: json['user_cart_count'] as int?,
      maxPrice: json['max_price'] as int?,
      minPrice: (json['min_price'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'meta': meta?.toJson(),
        'status': status,
        'message': message,
        'user_cart_count': userCartCount,
        'max_price': maxPrice,
        'min_price': minPrice,
      };
}
