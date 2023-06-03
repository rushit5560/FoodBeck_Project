import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool hidePass = true.obs;
  RxBool hideNewPass = true.obs;
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController loginNewPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}