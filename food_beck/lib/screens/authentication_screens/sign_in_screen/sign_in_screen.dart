import 'package:flutter/material.dart';
import 'package:food_beck/utils/custom_functions.dart';
import 'package:get/get.dart';
import '../../../constants/color.dart';
import '../../../controllers/auth_controllers/sign_in_screen_controller.dart';
import 'sign_in_screen_widgets.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final loginScreenController = Get.put(SignInScreenController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyBoard(),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SignInAllModule().paddingSymmetric(horizontal: 25),
      ),
    );
  }
}
