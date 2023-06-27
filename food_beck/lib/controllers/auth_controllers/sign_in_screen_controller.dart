import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_beck/screens/location_screen/location_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/api_url.dart';
import '../../models/sign_in_model/sign_in_model.dart';
import '../../screens/index_screen/index_screen.dart';
import '../../utils/user_preferences.dart';
import 'package:dio/dio.dart' as dio;

class SignInScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxBool hidePass = true.obs;
  GlobalKey<FormState> signInformKey = GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  UserPreference userPreference = UserPreference();
  final dioRequest = dio.Dio();
  RxBool isUserLocationStatus = false.obs;

  /// Login Function
  Future<void> userLoginFunction() async {
    isLoading(true);
    String url = ApiUrl.loginApi;
    log('userLoginFunction Api Url :$url');

    try {
      Map<String, dynamic> bodyData = {
        "email": loginEmailController.text.trim().toLowerCase(),
        "password": loginPasswordController.text.trim(),
      };
      final response = await dioRequest.post(
        url,
        data: bodyData,
      );
      log('userLoginFunction response :${response.data}');
      SignInModel signInModel = SignInModel.fromJson(response.data);
      isSuccessStatus.value = signInModel.success;
      // var request = http.MultipartRequest('POST', Uri.parse(url));

      // request.fields['email'] = loginEmailController.text.trim().toLowerCase();
      // request.fields['password'] = loginPasswordController.text.trim();

      // var response = await request.send();
      // log('request.fields: ${request.fields}');

      // response.stream.transform(utf8.decoder).listen((value) async {
      //   SignInModel signInModel = SignInModel.fromJson(json.decode(value));

      // });
      if (isSuccessStatus.value) {
        userPreference.setBoolValueInPrefs(
            key: UserPreference.isUserLoggedInKey, value: true);
        userPreference.setStringValueInPrefs(
            key: UserPreference.userIdKey,
            value: signInModel.data.id.toString());
        userPreference.setStringValueInPrefs(
          key: UserPreference.userTokenKey,
          value: signInModel.token,
        );
        userPreference.setStringValueInPrefs(
          key: UserPreference.userEmailKey,
          value: signInModel.data.email,
        );
        userPreference.setStringValueInPrefs(
          key: UserPreference.userNameKey,
          value: signInModel.data.name,
        );
        userPreference.setStringValueInPrefs(
          key: UserPreference.userPhoneKey,
          value: signInModel.data.phoneno,
        );
        userPreference.setStringValueInPrefs(
          key: UserPreference.userImageKey,
          value: signInModel.data.image,
        );
        userPreference.setStringValueInPrefs(
          key: UserPreference.userZoneIdKey,
          value: signInModel.data.zoneId.toString(),
        );
        if (isUserLocationStatus.value == false) {
          Get.to(() => LocationScreen());
        } else {
          Get.offAll(() => IndexScreen());
        }
        log("signInModel.token : ${signInModel.token}");
        loginEmailController.clear();
        loginPasswordController.clear();
      } else {
        log('userLoginFunction Else');
        Fluttertoast.showToast(msg: signInModel.error);
        log("signInModel.error ${signInModel.error}");
      }
    } catch (e) {
      log('userLoginFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }

  Future initMethod() async {
    isUserLocationStatus.value = await userPreference.getBoolFromPrefs(
        key: UserPreference.isUserLoggedInKey);
    log('isUserLocationStatus.value 222 : ${isUserLocationStatus.value}');
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
/*@override
  void onInit() {
    loginEmailController.clear();
    loginPasswordController.clear();
    super.onInit();
  }*/
}
