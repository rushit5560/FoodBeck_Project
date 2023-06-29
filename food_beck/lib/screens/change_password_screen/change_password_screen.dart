import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/common_appbar.dart';
import '../../common_modules/custom_loader.dart';
import '../../constants/color.dart';
import '../../constants/message.dart';
import '../../controllers/change_password_screen_controller.dart';
import '../../utils/validator.dart';
import '../../utils/widget/common_button.dart';
import '../../utils/widget/common_text_form_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final changePasswordScreenController =
      Get.put(ChangePasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleText: AppMessage.changePassword,
        leadingShow: false,
        actionShow: false,
      ),
      body: Obx(
        () => changePasswordScreenController.isLoading.value
            ? const CustomLoader()
            : Form(
                key: changePasswordScreenController.changePasswordFormKey,
                child: Column(
                  children: [
                    // Old Password Field
                    Obx(
                      () => CommonTextFormFieldModule(
                        fieldController: changePasswordScreenController
                            .passwordFieldController,
                        validate: (value) =>
                            FieldValidation().validateOldPassword(value!),
                        hintText: AppMessage.enterOldPassword,
                        keyboardType: TextInputType.text,
                        color: AppColors.grey50Color,
                        obscureText: changePasswordScreenController
                            .isPasswordVisible.value,
                        suffixIcon: IconButton(
                          onPressed: () => changePasswordScreenController
                              .changePasswordVisibility(),
                          icon: changePasswordScreenController
                                  .isPasswordVisible.value
                              ? const Icon(Icons.visibility_off_rounded)
                              : const Icon(Icons.visibility_rounded),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),

                    // New Password Field
                    Obx(
                      () => CommonTextFormFieldModule(
                        fieldController: changePasswordScreenController
                            .newPasswordFieldController,
                        validate: (value) =>
                            FieldValidation().validateNewPassword(value!, changePasswordScreenController.passwordFieldController.text.trim()),
                        hintText: AppMessage.enterNewPassword,
                        keyboardType: TextInputType.text,
                        color: AppColors.grey50Color,
                        obscureText: changePasswordScreenController
                            .isNewPasswordVisible.value,
                        suffixIcon: IconButton(
                          onPressed: () => changePasswordScreenController
                              .changeNewPasswordVisibility(),
                          icon: changePasswordScreenController
                                  .isNewPasswordVisible.value
                              ? const Icon(Icons.visibility_off_rounded)
                              : const Icon(Icons.visibility_rounded),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),

                    // Confirm New Password Field
                    Obx(
                          () => CommonTextFormFieldModule(
                        fieldController: changePasswordScreenController
                            .cNewPasswordFieldController,
                            validate: (value) =>
                            FieldValidation().validateConfirmPassword(
                          value!,
                          changePasswordScreenController
                              .newPasswordFieldController.text
                              .trim(),
                        ),
                        hintText: AppMessage.enterConfirmPassword,
                        keyboardType: TextInputType.text,
                        color: AppColors.grey50Color,
                        obscureText: changePasswordScreenController
                            .isCNewPasswordVisible.value,
                        suffixIcon: IconButton(
                          onPressed: () => changePasswordScreenController
                              .changeCNewPasswordVisibility(),
                          icon: changePasswordScreenController
                              .isCNewPasswordVisible.value
                              ? const Icon(Icons.visibility_off_rounded)
                              : const Icon(Icons.visibility_rounded),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),


                    CustomButton(
                      height: 50,
                      onPressed: () async {
                        if (changePasswordScreenController.changePasswordFormKey.currentState!.validate()) {
                          await changePasswordScreenController.changePasswordFunction();
                        }
                      },
                      text: AppMessage.changePassword,
                    ),

                  ],
                ).paddingAll(10),
              ),
      ),
    );
  }
}
