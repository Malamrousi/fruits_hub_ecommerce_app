import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesService {
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return _instance;
  }

  SharedPreferencesService._internal();

  static late SharedPreferences _prefs;

 static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  void setString(String key, String value) {
    _prefs.setString(key, value);
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  void setBool(String key, bool value) {
    _prefs.setBool(key, value);
  }

  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  void setInt(String key, int value) {
    _prefs.setInt(key, value);
  }

  double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  void setDouble(String key, double value) {
    _prefs.setDouble(key, value);
  }

  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  void setStringList(String key, List<String> value) {
    _prefs.setStringList(key, value);
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  Future<bool> clear() {
    return _prefs.clear();
  }
}
