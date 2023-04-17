import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_back/constance/extension.dart';
import 'package:food_back/constance/font_family.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:food_back/constance/app_images.dart' as constance;
import '../../../constance/color.dart';
import '../../../constance/message.dart';
import '../../../constance/style.dart';
import '../../../controller/auth_controller/login_screen_controller.dart';
import '../../../utils/widget/common_button.dart';
import '../../../utils/widget/common_text_form_field.dart';
import '../../../utils/widget/validator.dart';
import '../../Home_screen/home_screen.dart';
import '../password/forgot_screen/forgot_screen.dart';
import '../sign_up_screen/sign_up_screen.dart';

class SignInAllModule extends StatelessWidget {
  SignInAllModule({Key? key}) : super(key: key);
  final loginScreenController = Get.find<LoginScreenController>();
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: loginScreenController.formKey,
      /// icon Widget
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Hero(
            tag: AppMessage.appIcon,
            child: Image.asset(constance.AppImages.AppLogo, height: 100),
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
            AppMessage.welcomeBack,
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
            AppMessage.signInWithContinue,
            textAlign: TextAlign.center,
            style: TextStyleConfig.textStyle(
              fontWeight: FontWeight.bold,
              textColor: AppColors.greyColor,
              fontFamily: FontFamilyText.sFProDisplayRegular,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(height: 2.h),
          /// both textfiled
          CommonTextFormFieldModule(
            fieldController: loginScreenController.loginEmailController,
            validate: (value) => FieldValidation().validateUserEmail(value!),
            hintText: AppMessage.emailOrPhoneNumber,
            keyboardType: TextInputType.text,
            color: AppColors.grey50Color,
          ),
          SizedBox(height: 2.h),
          Obx(()=>
            CommonTextFormFieldModule(
              fieldController: loginScreenController.loginPasswordController,
              validate: (value) => FieldValidation().validUserPassword(value!),
              hintText: AppMessage.password,
              keyboardType: TextInputType.text,
              obscureText: loginScreenController.hidePass.value,
              color: AppColors.grey50Color,
              suffixIcon: GestureDetector(
                child: Icon(
                  loginScreenController.hidePass.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () => {
                  loginScreenController.hidePass.value = !loginScreenController.hidePass.value,
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          /// forgot password text
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    Get.to(ForgotPasswordScreen());},
                  child: Text(AppMessage.forgotPassword,
                      textAlign: TextAlign.center,
                    style: TextStyleConfig.textStyle(
                      fontFamily: FontFamilyText.sFProDisplayRegular,
                      fontWeight: FontWeight.bold,
                      textColor: AppColors.greenColor,
                      fontSize: 15.sp,
                    ),
                  ),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          CustomButton(
              height: 50,
              onPressed: () {
                if (loginScreenController.formKey.currentState!.validate()) {
                  Get.to(()=> SignUpScreen());
                }
              },
              text: AppMessage.signIn,
          ),
          SizedBox(height: 3.h),
          /// or text
          Row(
            children:  [
               const Expanded(
                  child: Divider(
                    color: AppColors.greyColor,
                    thickness: 1,
                  ),
              ),
              SizedBox(width: 2.w),
                Text(AppMessage.or,
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
                backgroundColor: AppColors.blueColor,
                child: IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.facebookF,
                    color: AppColors.whiteColor,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ),
              CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.skyColor,
                  child: IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.twitter,
                      color: AppColors.whiteColor,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
              ),
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
              Text(AppMessage.youDonTHaveAnAccount,
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
                  //Navigator.pushReplacementNamed(context, Routes.SINGIN);
                },
                child: Text(AppMessage.signUp,
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
          ),
      ]
    ),
    );
  }
}
