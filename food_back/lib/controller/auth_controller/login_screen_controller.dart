import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  RxBool isLoading = false.obs;
   RxBool hidePass = true.obs;
  TextEditingController loginEmailController = TextEditingController(text: "abc@gmail.com");
  TextEditingController loginPasswordController = TextEditingController(text: "Abc@12343");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
