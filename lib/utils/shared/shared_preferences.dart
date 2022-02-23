import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveDataLocal({required String key, required dynamic value, required String option}) async {
    final prefs = await SharedPreferences.getInstance();
    switch (option) {
      case 'String':
        final result = prefs.setString(key, value);
        break;
      case 'Bool':
        final result = prefs.setBool(key, value);
        break;
      case 'Int':
        final result = prefs.setInt(key, value);
        break;
      default:
    }
  }

  // static Future<bool> saveDataLocal({required String key, required String value}) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final result = prefs.setString(key, value);
  //   return result;
  // }

  static Future<dynamic> loadDataLocal({required dynamic key, required String option}) async {
    final prefs = await SharedPreferences.getInstance();

    switch (option) {
      case 'String':
        final result = prefs.getString(key);
        return result;
      case 'Bool':
        final result = prefs.getBool(key);
        return result;
      case 'Int':
        final int? result = prefs.getInt(key);
        return result;
      default:
    }
  }

  static Future<bool> removeDataLocal(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.remove(key);
    return result;
  }
}
