import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

import 'userdetails.dart';

class UserPreference {
  static String isUserLoggedInKey = "isUserLoggedInKey"; // Bool
  static String isUserOnBoardingKey = "isUserOnBoardingKey"; // Bool
  static String isUserLocationKey = "isUserLocationKey";

  static String userIdKey = "userIdKey"; // String
  static String userZoneIdKey = "userZoneIdKey"; // String
  static String userTokenKey = "userTokenKey"; // String
  static String userEmailKey = "userEmailKey"; // String
  static String userNameKey = "userNameKey"; // String
  static String userPhoneKey = "userPhoneKey"; // String
  static String userImageKey = "userImageKey"; // String
  static String userAddressKey = "userAddressKey"; //String
  static String cartRestaurantIdKey = "cartRestaurantIdKey"; //String
  static String cartIdKey = "cartIdKey"; //String

  static String latitudeKey = "latitudeKey";
  static String longitudeKey = "longitudeKey";
  static String cartIsEmptyKey="cartIsEmptyKey";

  // String userProfileImageKey = "userProfileImageKey"; //string

// logout function
  Future<void> removeuserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(isUserLoggedInKey, false);
    prefs.setBool(isUserOnBoardingKey, false);
    prefs.setBool(isUserLocationKey, false);
    prefs.setBool(cartIsEmptyKey, true);

    prefs.setString(userIdKey, '');
    prefs.setString(cartRestaurantIdKey, '');
    prefs.setString(cartIdKey, '');

    prefs.setString(userZoneIdKey, '');
    prefs.setString(userTokenKey, '');
    prefs.setString(userEmailKey, '');
    prefs.setString(userNameKey, '');
    prefs.setString(userPhoneKey, '');
    prefs.setString(userImageKey, '');
    prefs.setString(userAddressKey, '');
    prefs.setString(latitudeKey, '');
    prefs.setString(longitudeKey, '');

  }

  /// Set UserName & Profile Pic
  setUserProfilePrefs({required String userProfileImage,
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
    log('Prefs Save Value String: ${prefs.getString(key)}');
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

// Get double Value From Prefs

  Future<void> getDoubleValueFromPrefs(
      {required String key, required double value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value.toString());
    log('Prefs Save Value : ${prefs.getString(key)}');
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
