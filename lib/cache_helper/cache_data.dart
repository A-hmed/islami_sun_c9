import 'package:shared_preferences/shared_preferences.dart';

class CacheData
{
  static late SharedPreferences preferences;

  static Future<void> cacheInitialization() async
  {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setData({required String key, required bool value}) async
  {
      await preferences.setBool(key, value);
  }

  static bool getLocal({required String key})
  {
    return preferences.getBool(key) ?? false;
  }

  static Future<void> setTheme({required String key, required bool value}) async
  {
    await preferences.setBool(key, value);
  }

  static bool getTheme({required String key})
  {
    return preferences.getBool(key) ?? false;
  }
}