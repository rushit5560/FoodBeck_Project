import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  RxBool isLoading = false.obs;
   RxBool hidePass = true.obs;
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
