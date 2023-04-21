import 'package:flutter/material.dart';
import 'package:food_back/common_modules/custom_loader.dart';
import 'package:food_back/screens/edit_profile_screen/edit_profile_screen_widgets.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:food_back/utils/widget/common_text_form_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constance/color.dart';
import '../../constance/font_family.dart';
import '../../constance/message.dart';
import '../../controller/edit_profile_screen_controller.dart';
import '../../model/sign_up_model/zone_model.dart';
import '../../utils/style.dart';
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
                      ProfileImageModule().commonOnlyPadding(top: 20),

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
                                child: Text(items.name),
                              );
                            }).toList(),
                          ),
                        ).commonSymmetricPadding(horizontal: 15),
                      ),

                      SizedBox(height: 3.h),
                      InkWell(
                        onTap: () async {
                          await editProfileScreenController
                              .updateProfileDataFunction();
                          //Navigator.pushReplacementNamed(context, Routes.SINGIN);
                        },
                        child: Text(
                          AppMessage.saveProfile,
                          textAlign: TextAlign.center,
                          style: TextStyleConfig.textStyle(
                            fontFamily: FontFamilyText.sFProDisplayRegular,
                            fontWeight: FontWeight.bold,
                            textColor: AppColors.greenColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ).commonSymmetricPadding(horizontal: 20),
                ),
              ),
      ),
    );
  }
}
