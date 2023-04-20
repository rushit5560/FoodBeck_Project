import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_back/constance/api_url.dart';
import 'package:get/get.dart';

class EditProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;

  GlobalKey<FormState> updateProfileKey = GlobalKey<FormState>();
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController phoneNoFieldController = TextEditingController();


  /// Get Profile Function
  Future<void> getUserProfileFunction() async {
    isLoading(true);
    String url = ApiUrl.profileApi;
    log("getUserProfileFunction Api Url : $url");
  }

}