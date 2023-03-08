import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static SharedPreferences? sharedPreferences;
  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBool(
      {required String key, required bool value}) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getBool({required String key}) {
    return sharedPreferences!.getBool(key);
  }

  static Future<bool> saveData(
      {required String key, required String value}) async {
    return sharedPreferences!.setString(key, value);
  }

  static String? getString({
    required String key,
  }) {
    return sharedPreferences!.getString(key);
  }
}
