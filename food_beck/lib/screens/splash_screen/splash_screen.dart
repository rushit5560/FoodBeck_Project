import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_images.dart';
import '../../constants/color.dart';
import '../../constants/font_family.dart';
import '../../constants/message.dart';
import '../../controllers/splash_screen_controller.dart';
import '../../utils/style.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final splashScreenController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.greenColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: AppMessage.appIcon,
                      child: Image.asset(
                        AppImages.AppLogo,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                AppMessage.foodBack,
                textAlign: TextAlign.center,
                style: TextStyleConfig.textStyle(
                  fontFamily: FontFamilyText.sFProDisplayBold,
                  textColor: AppColors.whiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
