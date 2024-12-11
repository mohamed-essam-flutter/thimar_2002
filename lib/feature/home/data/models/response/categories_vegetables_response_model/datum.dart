import 'unit.dart';

class Datum {
  int? categoryId;
  int? id;
  String? title;
  String? description;
  String? code;
  int? priceBeforeDiscount;
  double? price;
  double? discount;
  int? amount;
  int? isActive;
  bool? isFavorite;
  Unit? unit;
  List<dynamic>? images;
  String? mainImage;
  String? createdAt;

  Datum({
    this.categoryId,
    this.id,
    this.title,
    this.description,
    this.code,
    this.priceBeforeDiscount,
    this.price,
    this.discount,
    this.amount,
    this.isActive,
    this.isFavorite,
    this.unit,
    this.images,
    this.mainImage,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categoryId: json['category_id'] as int?,
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        code: json['code'] as String?,
        priceBeforeDiscount: json['price_before_discount'] as int?,
        price: (json['price'] as num?)?.toDouble(),
        discount: (json['discount'] as num?)?.toDouble(),
        amount: json['amount'] as int?,
        isActive: json['is_active'] as int?,
        isFavorite: json['is_favorite'] as bool?,
        unit: json['unit'] == null
            ? null
            : Unit.fromJson(json['unit'] as Map<String, dynamic>),
        images: json['images'] as List<dynamic>?,
        mainImage: json['main_image'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'category_id': categoryId,
        'id': id,
        'title': title,
        'description': description,
        'code': code,
        'price_before_discount': priceBeforeDiscount,
        'price': price,
        'discount': discount,
        'amount': amount,
        'is_active': isActive,
        'is_favorite': isFavorite,
        'unit': unit?.toJson(),
        'images': images,
        'main_image': mainImage,
        'created_at': createdAt,
      };
}
