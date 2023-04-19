import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../constance/color.dart';
import '../../../../constance/font_family.dart';
import '../../../../constance/message.dart';
import '../../../../controller/auth_controller/reset_password_screen_controller.dart';
import '../../../../utils/style.dart';
import '../../../../utils/widget/common_text_form_field.dart';
import '../../../../utils/validator.dart';

class ResetPasswordAllModule extends StatelessWidget {
   ResetPasswordAllModule({Key? key}) : super(key: key);
   final resetPasswordScreenController = Get.find<ResetPasswordScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: resetPasswordScreenController.formKey,
          child: Expanded(
            child: ListView(
              children: [
                Text(
                  AppMessage.resetPassword,
                  textAlign: TextAlign.center,
                  style: TextStyleConfig.textStyle(
                    fontFamily: FontFamilyText.sFProDisplayBold,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.blackColor,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  AppMessage.resetPasswordText,
                  textAlign: TextAlign.center,
                  style: TextStyleConfig.textStyle(
                    fontFamily: FontFamilyText.sFProDisplayRegular,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.greyColor,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Obx(()=>
                    CommonTextFormFieldModule(
                      fieldController: resetPasswordScreenController.loginPasswordController,
                      validate: (value) => FieldValidation().validateUserMobileNumber(value!),
                      hintText: AppMessage.newPassword,
                      keyboardType: TextInputType.text,
                      obscureText: resetPasswordScreenController.hidePass.value,
                      color: AppColors.grey50Color,
                      suffixIcon: GestureDetector(
                        child: Icon(
                          resetPasswordScreenController.hidePass.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).primaryColor,
                        ),
                        onTap: () => {
                          resetPasswordScreenController.hidePass.value = !resetPasswordScreenController.hidePass.value,
                        },
                      ),
                    ),
                ),
                SizedBox(height: 2.h),
                Obx(()=>
                    CommonTextFormFieldModule(
                      fieldController: resetPasswordScreenController.loginNewPasswordController,
                      validate: (value) => FieldValidation().validateUserMobileNumber(value!),
                      hintText: AppMessage.confirmNewPassword,
                      keyboardType: TextInputType.text,
                      obscureText: resetPasswordScreenController.hideNewPass.value,
                      color: AppColors.grey50Color,
                      suffixIcon: GestureDetector(
                        child: Icon(
                          resetPasswordScreenController.hideNewPass.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).primaryColor,
                        ),
                        onTap: () => {
                          resetPasswordScreenController.hideNewPass.value = !resetPasswordScreenController.hideNewPass.value,
                        },
                      ),
                    ),
                ),
                SizedBox(height: 3.h),
                InkWell(
                  onTap: () {
                   // Navigator.pushReplacementNamed(context, Routes.VERIFICATION);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        AppMessage.resetPassword,
                        textAlign: TextAlign.center,
                        style:
                        Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
