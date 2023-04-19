import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../constance/color.dart';
import '../../../../constance/font_family.dart';
import '../../../../constance/message.dart';
import '../../../../controller/auth_controller/forgot_screen_controller.dart';
import '../../../../utils/style.dart';
import '../../../../utils/widget/common_button.dart';
import '../../../../utils/widget/common_text_form_field.dart';
import '../../../../utils/validator.dart';
import '../reset_password_screen/reset_password_screen.dart';

class ForgotPasswordAllModule extends StatelessWidget {
   ForgotPasswordAllModule({Key? key}) : super(key: key);
   final forgotPasswordScreenController = Get.find<ForgotPasswordScreenController>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: forgotPasswordScreenController.formKey,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Text(
                  AppMessage.forgotPassword,
                  textAlign: TextAlign.center,
                  style: TextStyleConfig.textStyle(
                    fontFamily: FontFamilyText.sFProDisplayBold,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.blackColor,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  AppMessage.forgotPasswordText,
                  textAlign: TextAlign.center,
                  style: TextStyleConfig.textStyle(
                    fontFamily: FontFamilyText.sFProDisplayRegular,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.greyColor,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 3.h),
                CommonTextFormFieldModule(
                  fieldController: forgotPasswordScreenController.passwordController,
                  validate: (value) => FieldValidation().validateUserMobileNumber(value!),
                  hintText: AppMessage.emailOrPhoneNumber,
                  keyboardType: TextInputType.text,
                  color: AppColors.grey50Color,
                ),
                SizedBox(height: 2.h),
                CustomButton(
                  height: 50,
                  text: AppMessage.send,
                  onPressed: () {
                    if (forgotPasswordScreenController.formKey.currentState!.validate()) {
                      Get.to(ResetPasswordScreen());
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
