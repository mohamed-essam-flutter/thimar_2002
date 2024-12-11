import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final int? id;
  final String? title;
  final String? image;
  final int? amount;
  final int? priceBeforeDiscount;
  final dynamic discount;
  final dynamic price;
  final dynamic remainingAmount;

  const Datum({
    this.id,
    this.title,
    this.image,
    this.amount,
    this.priceBeforeDiscount,
    this.discount,
    this.price,
    this.remainingAmount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        title: json['title'] as String?,
        image: json['image'] as String?,
        amount: json['amount'] as int?,
        priceBeforeDiscount: json['price_before_discount'] as int?,
        discount: json['discount'] as dynamic,
        price: json['price'] as dynamic,
        remainingAmount: (json['remaining_amount'] as dynamic)
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'amount': amount,
        'price_before_discount': priceBeforeDiscount,
        'discount': discount,
        'price': price,
        'remaining_amount': remainingAmount,
      };

  @override
  List<Object?> get props {
    return [
      id,
      title,
      image,
      amount,
      priceBeforeDiscount,
      discount,
      price,
      remainingAmount,
    ];
  }
}
