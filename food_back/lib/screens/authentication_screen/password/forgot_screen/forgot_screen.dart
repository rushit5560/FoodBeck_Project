import 'package:flutter/material.dart';
import 'package:food_back/constance/color.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:food_back/controller/auth_controller/forgot_screen_controller.dart';
import 'package:get/get.dart';

import '../../../../utils/widget/common_appbar.dart';
import 'forgot_screen_widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({Key? key}) : super(key: key);
final forgotPasswordScreenController = Get.put(ForgotPasswordScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteColor2,
      appBar: commonAppBarModule(iconColor: AppColors.blackColor),
      body: ForgotPasswordAllModule().commonSymmetricPadding(horizontal: 20),
    );
  }
}
