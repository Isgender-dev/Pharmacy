import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const _key = "token";

  static String? token;

  static Future<void> saveToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, value);
    token = value;
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString(_key);
    return token;
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
    token = null;
  }
}