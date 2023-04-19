import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  static String isUserLoggedInKey = "isUserLoggedInKey"; // Bool
  static String userIdKey = "userIdKey"; // String
  static String userZoneIdKey = "userZoneIdKey"; // String
  static String userTokenKey = "userTokenKey"; // String
  static String userEmailKey = "userEmailKey"; // String
  static String userNameKey = "userNameKey"; // String


  // Set String Value in Prefs
  Future<void> setStringValueInPrefs({required String key, required String value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    log('Prefs Save Value : ${prefs.getString(key)}');
  }

  // Get String Value From Prefs
  Future<String?> getStringValueFromPrefs({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    return value!;
  }

  // Set Bool Value in Prefs
  Future<void> setBoolValueInPrefs({required String key, required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
    log('Prefs Save Value : ${prefs.getBool(key)}');
  }

  // Get String Value From Prefs
  Future<bool?> getBoolValueFromPrefs({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool(key);
    return value!;
  }


}