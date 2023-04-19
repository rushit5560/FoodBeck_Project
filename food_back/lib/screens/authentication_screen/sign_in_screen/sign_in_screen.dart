import 'package:flutter/material.dart';
import 'package:food_back/controller/auth_controller/sign_in_screen_controller.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';

import '../../../constance/color.dart';
import 'sign_in_screen_widgets.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final loginScreenController = Get.put(SignInScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SignInAllModule().commonSymmetricPadding(horizontal: 25),
    );
  }
}
