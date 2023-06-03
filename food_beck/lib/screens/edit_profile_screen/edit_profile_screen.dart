import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/custom_loader.dart';
import '../../common_modules/custom_submit_button.dart';
import '../../constants/color.dart';
import '../../constants/message.dart';
import '../../controllers/edit_profile_screen_controller.dart';
import '../../models/sign_up_model/zone_model.dart';
import '../../utils/validator.dart';
import '../../utils/widget/common_text_form_field.dart';
import 'edit_profile_screen_widgets.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final editProfileScreenController = Get.put(EditProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text(
          AppMessage.editProfile,
          style: const TextStyle(color: AppColors.blackColor),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.blackColor,
          ),
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
                      ProfileImageModule().paddingOnly(top: 20),

                      SizedBox(height: 5.h),
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

                      /// Dropdown Module
                      Container(
                        width: Get.width,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: AppColors.grey50Color,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<ZoneData>(
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(15),
                            value:
                                editProfileScreenController.selectedZoneValue,
                            onChanged: (value) => editProfileScreenController
                                .selectValueFromDropdown(value!),
                            items: editProfileScreenController.zoneList
                                .map((ZoneData items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items.name!),
                              );
                            }).toList(),
                          ),
                        ).paddingSymmetric(horizontal: 15),
                      ),

                      SizedBox(height: 3.h),

                      CustomSubmitButtonModule(
                        labelText: AppMessage.editProfile,
                        onPress: () async {
                          log("11");
                          await editProfileScreenController
                              .updateProfileButtonOntap();
                        },
                      ),

                      SizedBox(height: 5.h),
                    ],
                  ).paddingSymmetric(horizontal: 20),
                ),
              ),
      ),
    );
  }
}
