import 'package:flutter/material.dart';
import 'package:food_back/common_modules/custom_loader.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:food_back/utils/widget/common_text_form_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constance/color.dart';
import '../../constance/message.dart';
import '../../controller/edit_profile_screen_controller.dart';
import '../../utils/validator.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final editProfileScreenController = Get.put(EditProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppMessage.editProfile,
          style: const TextStyle(color: AppColors.blackColor),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
      ),
      body: Obx(
        () => editProfileScreenController.isLoading.value
            ? const CustomLoader()
            : SingleChildScrollView(
                child: Form(
                  key: editProfileScreenController.updateProfileKey,
                  child: Column(
                    children: [
                      CommonTextFormFieldModule(
                        fieldController:
                            editProfileScreenController.nameFieldController,
                        validate: (value) =>
                            FieldValidation().validateName(value!),
                        hintText: AppMessage.userName,
                        keyboardType: TextInputType.text,
                        color: AppColors.grey50Color,
                      ),
                      SizedBox(height: 2.h),

                      // Email Field
                      CommonTextFormFieldModule(
                        fieldController:
                            editProfileScreenController.emailFieldController,
                        validate: (value) =>
                            FieldValidation().validateUserEmail(value!),
                        hintText: AppMessage.emailOrPhoneNumber,
                        keyboardType: TextInputType.emailAddress,
                        color: AppColors.grey50Color,
                      ),
                      SizedBox(height: 2.h),

                      // Phone Field
                      CommonTextFormFieldModule(
                        fieldController:
                            editProfileScreenController.phoneNoFieldController,
                        validate: (value) =>
                            FieldValidation().validateUserMobileNumber(value!),
                        hintText: AppMessage.enterNumber,
                        keyboardType: TextInputType.phone,
                        color: AppColors.grey50Color,
                      ),
                      SizedBox(height: 2.h),
                    ],
                  ).commonSymmetricPadding(horizontal: 20),
                ),
              ),
      ),
    );
  }
}
