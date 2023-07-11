import 'package:shared_preferences/shared_preferences.dart';

class GenericPreferences {
  static late SharedPreferences _sharedPreferences;

  // implement this method in main.dart
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setString(String key, String value) async {
    return await _sharedPreferences.setString(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _sharedPreferences.setBool(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    return await _sharedPreferences.setInt(key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    return await _sharedPreferences.setDouble(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    return await _sharedPreferences.setStringList(key, value);
  }

  static String getString(String key) {
    return _sharedPreferences.getString(key) ?? '';
  }

  static bool getBool(String key) {
    return _sharedPreferences.getBool(key) ?? false;
  }

  static int getInt(String key) {
    return _sharedPreferences.getInt(key) ?? 0;
  }

  static double getDouble(String key) {
    return _sharedPreferences.getDouble(key) ?? 0.0;
  }

  static List<String> getStringList(String key) {
    return _sharedPreferences.getStringList(key) ?? [];
  }

  static Future<bool> remove(String key) async {
    return await _sharedPreferences.remove(key);
  }

  static Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }

  static bool containsKey(String key) {
    return _sharedPreferences.containsKey(key);
  }

  static Set<String> getKeys() {
    return _sharedPreferences.getKeys();
  }

  static int getKeysCount() {
    return _sharedPreferences.getKeys().length;
  }

  static Future<void> reload() async {
    return await _sharedPreferences.reload();
  }
}
