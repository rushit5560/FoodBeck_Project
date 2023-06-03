import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/color.dart';
import '../../../../controllers/auth_controllers/reset_password_screen_controller.dart';
import '../../../../utils/widget/common_appbar.dart';
import 'reset_password_screen_widgets.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({Key? key}) : super(key: key);
final resetPasswordScreenController = Get.put(ResetPasswordScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteColor2,
      appBar: commonAppBarModule(iconColor: AppColors.blackColor),
      body:ResetPasswordAllModule().paddingSymmetric(horizontal: 15),
    );
  }
}
