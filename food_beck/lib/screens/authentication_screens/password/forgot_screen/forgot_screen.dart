import 'package:flutter/material.dart';
import 'package:food_beck/common_modules/common_appbar.dart';
import 'package:food_beck/constants/message.dart';
import 'package:get/get.dart';

import '../../../../constants/color.dart';
import '../../../../controllers/auth_controllers/forgot_screen_controller.dart';
import '../../../../utils/widget/common_appbar.dart';
import 'forgot_screen_widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({Key? key}) : super(key: key);
final forgotPasswordScreenController = Get.put(ForgotPasswordScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteColor2,
      // appBar: commonAppBarModule(iconColor: AppColors.blackColor),

      appBar: customAppBar(titleText: AppMessage.forgotPassword, leadingShow: false, actionShow: false),
      body: ForgotPasswordAllModule().paddingSymmetric(horizontal: 20),
    );
  }
}
