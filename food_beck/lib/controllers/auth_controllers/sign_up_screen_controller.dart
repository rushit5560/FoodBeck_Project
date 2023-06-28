import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/api_url.dart';
import '../../models/sign_up_model/sign_up_model.dart';
import '../../models/sign_up_model/zone_model.dart';
import '../../screens/authentication_screens/sign_in_screen/sign_in_screen.dart';
import '../../utils/user_preferences.dart';
import 'package:dio/dio.dart' as dio;

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
  final dioRequest = dio.Dio();

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
      final response = await dioRequest.get(url);
      ZoneModel zoneModel = ZoneModel.fromJson(response.data);
      isSuccessStatus.value = zoneModel.success;
      if (isSuccessStatus.value) {
        zoneList.clear();
        if (zoneModel.data.isNotEmpty) {
          zoneList.addAll(zoneModel.data);
          selectedZoneValue = zoneList[0];
        }
        log('selectedZoneValue : ${selectedZoneValue!.name}');
      } else {
        log('getZoneListFunction Else');
      }
    } catch (e) {
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
      Map<String, dynamic> bodyData = {
        "name": nameFieldController.text.trim(),
        "email": emailFieldController.text.trim().toLowerCase(),
        "phoneno": phoneFieldController.text,
        "password": passwordFieldController.text.trim(),
        "zone_id": "${selectedZoneValue!.id}",
      };
      final response = await dioRequest.post(
        url,
        data: bodyData,
      );
      log('userRegisterFunction response :${response.data}');
      SignUpModel signUpModel =
          SignUpModel.fromJson(response.data);
      isSuccessStatus.value = signUpModel.success;
      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: signUpModel.message.toString());
        Get.back();
        Get.to(() => SignInScreen());
      } else {
        log('userRegisterFunction Else');
        Fluttertoast.showToast(msg: signUpModel.error);
      }
    } catch (e) {
      log('userRegisterFunction Error :$e');
      rethrow;
    }
    isLoading(false);
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
