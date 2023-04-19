import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_back/utils/user_preferences.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:food_back/constance/api_url.dart';
import 'package:get/get.dart';

import '../../model/sign_up_model/sign_up_model.dart';
import '../../model/sign_up_model/zone_model.dart';


class SignUpScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController cPasswordFieldController = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isCPasswordVisible = true.obs;

  List<ZoneData> zoneList = [];
  ZoneData? selectedZoneValue;

  UserPreference userPreference = UserPreference();

  changePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  changeConfirmPasswordVisibility() {
    isCPasswordVisible.value = !isCPasswordVisible.value;
  }

  selectValueFromDropdown(ZoneData value) {
    selectedZoneValue = value;
    loadUI();
  }

  /// Get Zone List Function
  Future<void> getZoneListFunction() async {
    isLoading(true);
    String url = ApiUrl.zoneApi;
    log('getZoneListFunction Api Url : $url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      log('getZoneListFunction Response :${response.body}');

      ZoneModel zoneModel = ZoneModel.fromJson(json.decode(response.body));
      isSuccessStatus.value = zoneModel.success;

      if(isSuccessStatus.value) {
        zoneList.clear();
        if(zoneModel.data.isNotEmpty) {
          zoneList.addAll(zoneModel.data);
          selectedZoneValue = zoneList[0];
        }
        log('selectedZoneValue : ${selectedZoneValue!.name}');

      } else {
        log('getZoneListFunction Else');
      }



    } catch(e) {
      log('getZoneListFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }

  /// User Register Function
  Future<void> userRegisterFunction() async {
    isLoading(true);
    String url = ApiUrl.registerApi;
    log('userRegisterFunction Api Url : $url');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['name'] = nameFieldController.text.trim();
      request.fields['email'] = emailFieldController.text.trim().toLowerCase();
      request.fields['phoneno'] = phoneFieldController.text;
      request.fields['password'] = passwordFieldController.text.trim();
      request.fields['c_password'] = cPasswordFieldController.text.trim();
      request.fields['zone_id'] = "${selectedZoneValue!.id}";

      var response = await request.send();
      log('request.fields: ${request.fields}');

      response.stream.transform(utf8.decoder).listen((value) async {
        SignUpModel signUpModel = SignUpModel.fromJson(json.decode(value));
        isSuccessStatus.value = signUpModel.success;

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: signUpModel.data.message);
          Get.back();
          // Get.to(()=> SignInScreen());
        } else {
          log('userRegisterFunction Else');
          Fluttertoast.showToast(msg: signUpModel.error);
        }

      });

    } catch(e) {
      log('userRegisterFunction Error :$e');
      rethrow;
    }


  }


  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    await getZoneListFunction();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}