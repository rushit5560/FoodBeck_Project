import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_beck/constants/api_url.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../models/change_password_screen_model/change_password_model.dart';
import '../utils/user_preferences.dart';


class ChangePasswordScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final dioRequest = dio.Dio();
  String userId = "";
  UserPreference userPreference = UserPreference();

  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController newPasswordFieldController = TextEditingController();
  TextEditingController cNewPasswordFieldController = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isNewPasswordVisible = true.obs;
  RxBool isCNewPasswordVisible = true.obs;

  changePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  changeNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }
  changeCNewPasswordVisibility() {
    isCNewPasswordVisible.value = !isCNewPasswordVisible.value;
  }


  // Change Password
  Future<void> changePasswordFunction() async {
    isLoading(true);
    String url = ApiUrl.changePasswordApi;
    log("changePasswordFunction Api Url :$url");

    try {
      String authorizationToken = await userPreference.getAuthorizationToken(
          key: UserPreference.userTokenKey);

      String finalToken = "Bearer $authorizationToken";

      Map<String, dynamic> bodyData = {
        "userid": userId,
        "oldpassword":passwordFieldController.text.trim(),
        "password":newPasswordFieldController.text.trim()
      };
      log('bodyData :${jsonEncode(bodyData)}');
      final response = await dioRequest.post(
          url,
          data: bodyData,
        options: dio.Options(
          headers: {
            "Accept": "application/json",
            "Authorization": finalToken,
          },
        ),
      );
      log('changePasswordFunction Response : ${jsonEncode(response.data)}');

      ChangePasswordModel changePasswordModel = ChangePasswordModel.fromJson(response.data);
      isSuccessStatus.value = changePasswordModel.success;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: changePasswordModel.message);
        Get.back();
      } else {
        log('changePasswordFunction Else');
      }

    } catch(e) {
      log('changePasswordFunction Error :$e');
    }
    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    userId = await userPreference.getStringValueFromPrefs(key: UserPreference.userIdKey) ?? "";
    log('userId : $userId');
  }



}