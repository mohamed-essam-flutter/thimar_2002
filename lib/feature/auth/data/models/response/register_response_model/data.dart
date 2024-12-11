import 'city.dart';
import 'country.dart';

class Data {
  int? id;
  String? fullname;
  String? phone;
  String? email;
  String? image;
  int? isBan;
  bool? isActive;
  int? unreadNotifications;
  String? userType;
  String? token;
  Country? country;
  City? city;
  dynamic identityNumber;
  int? userCartCount;

  Data({
    this.id,
    this.fullname,
    this.phone,
    this.email,
    this.image,
    this.isBan,
    this.isActive,
    this.unreadNotifications,
    this.userType,
    this.token,
    this.country,
    this.city,
    this.identityNumber,
    this.userCartCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        fullname: json['fullname'] as String?,
        phone: json['phone'] as String?,
        email: json['email'] as String?,
        image: json['image'] as String?,
        isBan: json['is_ban'] as int?,
        isActive: json['is_active'] as bool?,
        unreadNotifications: json['unread_notifications'] as int?,
        userType: json['user_type'] as String?,
        token: json['token'] as String?,
        country: json['country'] == null
            ? null
            : Country.fromJson(json['country'] as Map<String, dynamic>),
        city: json['city'] == null
            ? null
            : City.fromJson(json['city'] as Map<String, dynamic>),
        identityNumber: json['identity_number'] as dynamic,
        userCartCount: json['user_cart_count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'phone': phone,
        'email': email,
        'image': image,
        'is_ban': isBan,
        'is_active': isActive,
        'unread_notifications': unreadNotifications,
        'user_type': userType,
        'token': token,
        'country': country?.toJson(),
        'city': city?.toJson(),
        'identity_number': identityNumber,
        'user_cart_count': userCartCount,
      };
}
