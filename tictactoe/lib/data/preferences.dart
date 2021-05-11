import 'package:shared_preferences/shared_preferences.dart';

/*
 *  App shared preferences.
 */
enum AppPreference {
  loggedIn,
  darkMode,
  hindiLanguage,
}

/*
 *  App shared preference extension for retrieving data.
 */
extension AppPreferenceExtension on AppPreference {
  void save<T>(T content) => SharedPref().save(this.toString(), content);

  int get integer => SharedPref().getInt(this.toString());

  String get string => SharedPref().getString(this.toString());

  bool get boolean => SharedPref().getBoolean(this.toString());
}

/*
 *  Shared preferences helper class.
 */
class SharedPref {
  static SharedPreferences _preferences;

  static Future<void> load() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  void save<T>(String key, T content) {
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  getString(String key, {String defaultValue = ""}) {
    return _preferences.getString(key) ?? defaultValue;
  }

  bool getBoolean(String key, {bool defaultValue = false}) {
    return _preferences.getBool(key) ?? defaultValue;
  }

  int getInt(String key, {int defaultValue = 0}) {
    return _preferences.getInt(key) ?? defaultValue;
  }

  double getDouble(String key, {double defaultValue = 0.0}) {
    return _preferences.getDouble(key) ?? defaultValue;
  }

  List<String> getStringList(String key,
      {List<String> defaultValue = const []}) {
    return _preferences.getStringList(key) ?? defaultValue;
  }
}
