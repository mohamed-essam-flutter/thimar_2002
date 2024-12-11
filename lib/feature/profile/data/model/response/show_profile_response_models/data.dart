class Data {
  int? id;
  String? fullname;
  String? phone;
  String? image;
  dynamic city;
  int? isVip;

  Data({
    this.id,
    this.fullname,
    this.phone,
    this.image,
    this.city,
    this.isVip,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        fullname: json['fullname'] as String?,
        phone: json['phone'] as String?,
        image: json['image'] as String?,
        city: json['city'] as dynamic,
        isVip: json['is_vip'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'phone': phone,
        'image': image,
        'city': city,
        'is_vip': isVip,
      };
}
