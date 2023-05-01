import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_back/screens/authentication_screen/sign_in_screen/sign_in_screen.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common_modules/custom_loader.dart';
import '../../../constance/app_images.dart';
import '../../../constance/color.dart';
import '../../../constance/font_family.dart';
import '../../../constance/message.dart';
import '../../../controller/auth_controller/sign_up_screen_controller.dart';

import '../../../model/sign_up_model/zone_model.dart';
import '../../../utils/style.dart';
import '../../../utils/validator.dart';
import '../../../utils/widget/common_button.dart';
import '../../../utils/widget/common_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final signUpScreenController = Get.put(SignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Obx(
        () => signUpScreenController.isLoading.value
            ? const CustomLoader()
            : SingleChildScrollView(
                child: Form(
                  key: signUpScreenController.signUpFormKey,
                  child: SafeArea(
                    child: Column(
                      children: [
                        Hero(
                          tag: AppMessage.appIcon,
                          child: Image.asset(AppImages.AppLogo, height: 100),
                        ),

                        /// food back text
                        SizedBox(height: 1.h),
                        Text(
                          AppMessage.foodBack,
                          textAlign: TextAlign.center,
                          style: TextStyleConfig.textStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamilyText.sFProDisplaySemibold,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(height: 3.h),

                        /// welcome back text
                        Text(
                          AppMessage.signUp,
                          textAlign: TextAlign.center,
                          style: TextStyleConfig.textStyle(
                            fontFamily: FontFamilyText.sFProDisplayBold,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                          ),
                        ),
                        SizedBox(height: 1.h),

                        /// sign to continue text
                        Text(
                          AppMessage.signUpText,
                          textAlign: TextAlign.center,
                          style: TextStyleConfig.textStyle(
                            fontWeight: FontWeight.bold,
                            textColor: AppColors.greyColor,
                            fontFamily: FontFamilyText.sFProDisplayRegular,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 2.h),

                        // User Name Field
                        CommonTextFormFieldModule(
                          fieldController:
                              signUpScreenController.nameFieldController,
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
                              signUpScreenController.emailFieldController,
                          validate: (value) =>
                              FieldValidation().validateUserEmail(value!),
                          hintText: AppMessage.emailOrPhoneNumber,
                          keyboardType: TextInputType.emailAddress,
                          color: AppColors.grey50Color,
                          maxLength: 10,
                        ),
                        SizedBox(height: 2.h),

                        // Phone Field
                        CommonTextFormFieldModule(
                          fieldController:
                              signUpScreenController.phoneFieldController,
                          validate: (value) => FieldValidation()
                              .validateUserMobileNumber(value!),
                          hintText: AppMessage.enterNumber,
                          keyboardType: TextInputType.phone,
                          color: AppColors.grey50Color,
                        ),
                        SizedBox(height: 2.h),

                        // Password Field
                        Obx(
                          () => CommonTextFormFieldModule(
                            fieldController:
                                signUpScreenController.passwordFieldController,
                            validate: (value) =>
                                FieldValidation().validateUserPassword(value!),
                            hintText: AppMessage.enterPassword,
                            keyboardType: TextInputType.text,
                            color: AppColors.grey50Color,
                            obscureText:
                                signUpScreenController.isPasswordVisible.value,
                            suffixIcon: IconButton(
                              onPressed: () => signUpScreenController
                                  .changePasswordVisibility(),
                              icon:
                                  signUpScreenController.isPasswordVisible.value
                                      ? const Icon(Icons.visibility_off_rounded)
                                      : const Icon(Icons.visibility_rounded),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),

                        // Confirm Password Field
                        Obx(
                          () => CommonTextFormFieldModule(
                            fieldController:
                                signUpScreenController.cPasswordFieldController,
                            validate: (value) =>
                                FieldValidation().validateConfirmPassword(
                              value!,
                              signUpScreenController
                                  .passwordFieldController.text,
                            ),
                            hintText: AppMessage.enterConfirmPassword,
                            keyboardType: TextInputType.text,
                            color: AppColors.grey50Color,
                            obscureText:
                                signUpScreenController.isCPasswordVisible.value,
                            suffixIcon: IconButton(
                              onPressed: () => signUpScreenController
                                  .changeConfirmPasswordVisibility(),
                              icon: signUpScreenController
                                      .isCPasswordVisible.value
                                  ? const Icon(Icons.visibility_off_rounded)
                                  : const Icon(Icons.visibility_rounded),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),

                        /// Dropdown Module
                        Container(
                          width: Get.width,
                          decoration: const BoxDecoration(
                            color: AppColors.grey50Color,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<ZoneData>(
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(15),
                              value: signUpScreenController.selectedZoneValue,
                              onChanged: (value) => signUpScreenController
                                  .selectValueFromDropdown(value!),
                              items: signUpScreenController.zoneList
                                  .map((ZoneData items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items.name!),
                                );
                              }).toList(),
                            ),
                          ).commonSymmetricPadding(horizontal: 15),
                        ),

                        SizedBox(height: 3.h),

                        /// SignUp Button
                        CustomButton(
                          height: 50,
                          onPressed: () async {
                            if (signUpScreenController
                                .signUpFormKey.currentState!
                                .validate()) {
                              await signUpScreenController
                                  .userRegisterFunction();
                            }
                          },
                          text: AppMessage.signUp,
                        ),
                        SizedBox(height: 3.h),

                        /// or text
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: AppColors.greyColor,
                                thickness: 1,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              AppMessage.or,
                              style: TextStyleConfig.textStyle(
                                textColor: AppColors.greyColor,
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            const Expanded(
                              child: Divider(
                                color: AppColors.greyColor,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),

                        /// three icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                                radius: 18,
                                backgroundColor: AppColors.redColor,
                                child: IconButton(
                                  icon: const FaIcon(
                                      FontAwesomeIcons.googlePlusG,
                                      color: AppColors.whiteColor,
                                      size: 20),
                                  onPressed: () {},
                                )),
                          ],
                        ).commonSymmetricPadding(horizontal: 60),
                        SizedBox(height: 2.5.h),

                        /// sign up text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppMessage.alreadyHaveAccount,
                              textAlign: TextAlign.center,
                              style: TextStyleConfig.textStyle(
                                fontFamily: FontFamilyText.sFProDisplayRegular,
                                fontWeight: FontWeight.bold,
                                textColor: AppColors.greyColor,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(width: 1.w),
                            InkWell(
                              onTap: () {
                                Get.to(() => SignInScreen());
                              },
                              child: Text(
                                AppMessage.signIn,
                                textAlign: TextAlign.center,
                                style: TextStyleConfig.textStyle(
                                  fontFamily:
                                      FontFamilyText.sFProDisplayRegular,
                                  fontWeight: FontWeight.bold,
                                  textColor: AppColors.greenColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).commonSymmetricPadding(horizontal: 25),
                  ),
                ),
              ),
      ),
    );
  }
}
