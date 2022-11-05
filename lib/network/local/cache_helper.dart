import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper {

  static SharedPreferences? sharedPreferences;

  static init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> setBool(String key, bool value) async {
    return await sharedPreferences?.setBool(key, value);
  }

  static getBool (String key) async {
    return sharedPreferences?.getBool(key);
  }
  static clearValue (String key) {
    return sharedPreferences!.remove(key);
  }
}