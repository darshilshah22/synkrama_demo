import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<void> init() async {
    print("init called");
  }

  static void dispose() {
    print("Dispose called");
  }

  static Future<int> getInt(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? value;
  }

  static setInt(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static setString(String key, String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value!);
  }

  static Future<String> getString(String key, String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? value ?? "";
  }

  static setBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static setDouble(String key, double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  static Future<double> getDouble(String key, double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? value;
  }

  static Future<bool> remove(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
