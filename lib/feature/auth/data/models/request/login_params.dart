class LoginParams {
  final int phone;
  final int password;
  final String deviceToken;
  final String type;
  final String userType;
  LoginParams({
    required this.deviceToken,
    required this.type,
    required this.userType,
    required this.phone,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    return {
      "phone": phone,
      "password": password,
      "device_token": deviceToken,
      "type": type,
      "user_type": userType
    };
  }
}
