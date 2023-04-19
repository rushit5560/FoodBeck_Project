import 'package:flutter/material.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:food_back/screens/authentication_screen/password/reset_password_screen/reset_password_screen_widgets.dart';
import 'package:get/get.dart';

import '../../../../constance/color.dart';
import '../../../../controller/auth_controller/reset_password_screen_controller.dart';
import '../../../../utils/widget/common_appbar.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({Key? key}) : super(key: key);
final resetPasswordScreenController = Get.put(ResetPasswordScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteColor2,
      appBar: commonAppBarModule(iconColor: AppColors.blackColor),
      body:ResetPasswordAllModule().commonSymmetricPadding(horizontal: 15),
    );
  }
}
