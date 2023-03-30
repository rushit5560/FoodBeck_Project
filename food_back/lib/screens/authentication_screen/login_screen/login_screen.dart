import 'package:flutter/material.dart';
import 'package:food_back/constance/color.dart';
import 'package:food_back/constance/font_family.dart';
import 'package:food_back/constance/message.dart';
import 'package:food_back/controller/auth_controller/login_screen_controller.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:food_back/utils/style.dart';
import 'package:get/get.dart';
import 'package:food_back/constance/app_images.dart' as constance;
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginScreenController = Get.put(LoginScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Hero(
            tag: AppMessage.appIcon,
            child: Image.asset(constance.AppImages.AppLogo, height: 100),
          ),
          SizedBox(height: 2.h),
          Text(
            AppMessage.foodBack,
            textAlign: TextAlign.center,
            style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplayBold,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            AppMessage.welcomBack,
            textAlign: TextAlign.center,
            style: TextStyleConfig.textStyle(
              // fontWeight: FontWeight.bold,
              fontFamily: FontFamilyText.sFProDisplayBold,

              fontSize: 30.sp,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            AppMessage.signinWithContinue,
            textAlign: TextAlign.center,
            style: TextStyleConfig.textStyle(
              // fontWeight: FontWeight.bold,
              fontFamily: FontFamilyText.sFProDisplaySemibold,

              textColor: AppColors.greyColor,
              fontSize: 15.sp,
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(13),
          //     color: Theme.of(context).dividerColor,
          //   ),
          //   child: TextFormField(
          //     decoration: InputDecoration(
          //       contentPadding: EdgeInsets.only(left: 10),
          //       hintText: "Email or Phone Number",
          //       border: InputBorder.none,
          //       hintStyle: Theme.of(context).textTheme.headline1!.copyWith(
          //             fontSize: 16,
          //             fontWeight: FontWeight.w100,
          //             color: Colors.grey,
          //           ),
          //     ),
          //   ),
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).dividerColor,
          //     borderRadius: BorderRadius.circular(13),
          //   ),
          //   child: Obx(
          //     () => TextFormField(
          //       obscureText: loginScreenController.hidePass.value,
          //       decoration: InputDecoration(
          //         contentPadding: EdgeInsets.only(left: 10, top: 16),
          //         border: InputBorder.none,
          //         hintText: 'Password',
          //         hintStyle: Theme.of(context).textTheme.headline1!.copyWith(
          //             fontSize: 16,
          //             fontWeight: FontWeight.w100,
          //             color: Colors.grey),
          //         suffixIcon: GestureDetector(
          //           child: Icon(
          //             loginScreenController.hidePass.value
          //                 ? Icons.visibility_off
          //                 : Icons.visibility,
          //             color: Theme.of(context).primaryColor,
          //           ),
          //           onTap: () => {
          //             // setState(() => loginScreenController.hidePass.value = !loginScreenController.hidePass.value,),
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ).commonOnlyPadding(left: 4.w, right: 4.w, top: 2.h, bottom: 2.h),
    );
  }
}
