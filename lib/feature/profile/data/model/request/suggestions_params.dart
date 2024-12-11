class SuggestionsParams {
  final String name;
  final String phone;
  final String content;

  SuggestionsParams(
      {required this.name, required this.phone, required this.content});
  Map<String, dynamic> toJson() {
    return {'fullname': name, 'phone': phone, 'content': content};
  }
}
