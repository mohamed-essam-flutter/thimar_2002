class RegisterParams {
  final String name;
  final int phone;
  final int password;
  final int confirmPassword;

  RegisterParams(
      {required this.name,
      required this.phone,
      required this.password,
      required this.confirmPassword});
  Map<String, dynamic> toJson() {
    return {
      "fullname": name,
      "password": password,
      "phone": phone,
      "password_confirmation": confirmPassword
    };
  }
}
