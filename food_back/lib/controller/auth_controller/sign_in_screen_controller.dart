import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_back/screens/Home_screen/home_screen.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:food_back/constance/api_url.dart';
import 'package:get/get.dart';

import '../../model/sign_in_model/sign_in_model.dart';
import '../../utils/user_preferences.dart';

class SignInScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxBool hidePass = true.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  UserPreference userPreference = UserPreference();


  /// Login Function
  Future<void> userLoginFunction() async {
    isLoading(true);
    String url = ApiUrl.loginApi;
    log('userLoginFunction Api Url :$url');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['email'] = loginEmailController.text.trim().toLowerCase();
      request.fields['password'] = loginPasswordController.text.trim();

      var response = await request.send();
      log('request.fields: ${request.fields}');

      response.stream.transform(utf8.decoder).listen((value) async {
        SignInModel signInModel = SignInModel.fromJson(json.decode(value));
        isSuccessStatus.value = signInModel.success;

        if(isSuccessStatus.value) {
          userPreference.setBoolValueInPrefs(key: UserPreference.isUserLoggedInKey, value: true);
          userPreference.setStringValueInPrefs(key: UserPreference.userIdKey, value: signInModel.data.data.id.toString());
          userPreference.setStringValueInPrefs(key: UserPreference.userTokenKey, value: signInModel.data.token);
          userPreference.setStringValueInPrefs(key: UserPreference.userEmailKey, value: signInModel.data.data.email);
          userPreference.setStringValueInPrefs(key: UserPreference.userNameKey, value: signInModel.data.data.name);
          userPreference.setStringValueInPrefs(key: UserPreference.userZoneIdKey, value: signInModel.data.data.zoneId.toString());

          Get.offAll(()=> HomeScreen());
        } else {
          log('userLoginFunction Else');
          Fluttertoast.showToast(msg: signInModel.error);
        }
      });
    } catch(e) {
      log('userLoginFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }

}
