import 'package:flutter/material.dart';
import 'package:food_beck/constants/app_images.dart';
import 'package:food_beck/utils/style.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/common_appbar.dart';
import '../../constants/color.dart';
import '../../controllers/location_screen_controller.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({Key? key}) : super(key: key);
  final locationScreenController = Get.put(LocationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          titleText: "Set location", leadingShow: false, actionShow: false),
      body: Column(
        children: [
          Image.asset(AppImages.AppLogo, height: 200),
          SizedBox(height: 5.h),
          GestureDetector(
            onTap: () async {
              locationScreenController.getCurrentLocation();
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.greenColor,
              ),
              child: Center(
                child: Text(
                  "Get current location".toUpperCase(),
                  style: TextStyleConfig.textStyle(
                    textColor: AppColors.whiteColor2,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 3.h),
          GestureDetector(
            onTap: () async {},
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.greenColor,
              ),
              child: Center(
                child: Text(
                  "Get location using map".toUpperCase(),
                  style: TextStyleConfig.textStyle(
                    textColor: AppColors.whiteColor2,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ).paddingOnly(top: 25.h, right: 10, left: 10),
    );
  }
}
