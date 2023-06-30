import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_beck/constants/api_url.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class ForgotPasswordScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final dioRequest = dio.Dio();
  TextEditingController emailFieldController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  // Forgot password function
  Future<void> forgotPasswordFunction() async {
    isLoading(true);
    String url = ApiUrl.forgotPasswordApi;
    log('forgotPasswordFunction Api Url :$url');

    try {
      Map<String, dynamic> bodyData = {
        "email": emailFieldController.text.trim()
      };
      final response = await dioRequest.post(url,
        data: bodyData,
      );

      log('response :${jsonEncode(response.data)}');

      if(isSuccessStatus.value) {
        
      } else {
        log('forgotPasswordFunction Else');
      }

    } catch(e) {
      log('forgotPasswordFunction Error :$e');
    }



  }

}