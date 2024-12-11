import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String token = "token";
  static late SharedPreferences _shared_preferences;
  static Future<void> init() async {
    _shared_preferences = await SharedPreferences.getInstance();
  }

  static cacheData({required String key, required dynamic value}) {
    if (value is bool) {
      _shared_preferences.setBool(key, value);
    } else if (value is String) {
      _shared_preferences.setString(key, value);
    } else if (value is double) {
      _shared_preferences.setDouble(key, value);
    } else if (value is int) {
      _shared_preferences.setInt(key, value);
    } else {
      _shared_preferences.setStringList(key, value);
    }
  }

  static getData({required String key}) {
    return _shared_preferences.get(key);
  }
}
