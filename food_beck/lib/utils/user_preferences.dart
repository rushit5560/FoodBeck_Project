import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

import 'userdetails.dart';


class UserPreference {
  static String isUserLoggedInKey = "isUserLoggedInKey"; // Bool
  static String userIdKey = "userIdKey"; // String
  static String userZoneIdKey = "userZoneIdKey"; // String
  static String userTokenKey = "userTokenKey"; // String
  static String userEmailKey = "userEmailKey"; // String
  static String userNameKey = "userNameKey"; // String
  static String userPhoneKey = "userPhoneKey"; // String
  static String userImageKey = "userImageKey"; // String
  // String userProfileImageKey = "userProfileImageKey"; //string

// logout function
  Future<void> removeuserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(isUserLoggedInKey, false);
    prefs.setString(userIdKey, '');
    prefs.setString(userZoneIdKey, '');
    prefs.setString(userTokenKey, '');
    prefs.setString(userEmailKey, '');
    prefs.setString(userNameKey, '');
    prefs.setString(userPhoneKey, '');
    prefs.setString(userImageKey, '');
  }

  /// Set UserName & Profile Pic
  setUserProfilePrefs(
      {required String userProfileImage,
      required String userName,
      required String userEmail,
      required String userPhoneNo,
      required String userZoneId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    /// Remove Old Data
    prefs.remove(userImageKey);
    prefs.remove(userNameKey);
    prefs.remove(userEmailKey);
    prefs.remove(userPhoneNo);
    prefs.remove(userZoneIdKey);

    /// Add New Data
    prefs.setString(userImageKey, userProfileImage);
    prefs.setString(userNameKey, userName);
    prefs.setString(userEmailKey, userEmail);
    prefs.setString(userPhoneKey, userPhoneNo);
    prefs.setString(userZoneIdKey, userZoneId);

    /// Set Data in Local Variable
    UserDetails.userName = prefs.getString(userNameKey) ?? "UserName";
    UserDetails.userProfilePic = prefs.getString(userImageKey) ?? "";

    log("userName : ${UserDetails.userName}");
    log("userProfilePic : ${UserDetails.userProfilePic}");
  }

  // Set String Value in Prefs
  Future<void> setStringValueInPrefs(
      {required String key, required String value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    log('Prefs Save Value : ${prefs.getString(key)}');
  }

  // Get String Value From Prefs
  Future<String?> getStringValueFromPrefs({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    return value;
  }

  // Set Bool Value in Prefs
  Future<void> setBoolValueInPrefs(
      {required String key, required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
    log('Prefs Save Value : ${prefs.getBool(key)}');
  }

  // get Bool Value in Prefs
  Future<bool> getBoolFromPrefs({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = prefs.getBool(key) ?? false;
    return value;
  }

  // Get String Value From Prefs
  Future<bool?> getBoolValueFromPrefs({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool(key);
    return value!;
  }

  Future<String> getUserLoggedInFromPrefs({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key) ?? "";
    return value;
  }

  // get getAuthorizationToken From Sting
  Future<String> getAuthorizationToken({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key) ?? "";
    return value;
  }

  // Get String value
  Future<String> getStringFromPrefs({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key) ?? "";
    return value;
  }
}
