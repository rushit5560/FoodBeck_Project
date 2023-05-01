import 'package:flutter/material.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constance/color.dart';
import '../../controller/onboarding_screen_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);
  final introScreenController = Get.put(OnboardingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Positioned(
            //   top: -60,
            //   child: Image.asset(
            //     "AppImages.AppLogo",
            //     width: introScreenController.size.width,
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.topRight,
            //   child: Image.asset(
            //     " AppImages.AppLogo",
            //     color: AppColors.whiteColor,
            //     // width: controller.size.width,
            //   ),
            // ),
            SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: introScreenController.pageController,
                      onPageChanged: introScreenController.selectedPageIndex,
                      itemCount: introScreenController.onBoardingPages.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              introScreenController
                                  .onBoardingPages[index].imageAsset,
                              height: 40.h,
                            ).commonSymmetricPadding(horizontal: 30),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Text(
                                  introScreenController
                                      .onBoardingPages[index].logo,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: AppColors.greenColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3.h),
                            Row(
                              children: [
                                SizedBox(
                                  width: introScreenController.size.width * 0.6,
                                  child: Text(
                                    introScreenController
                                        .onBoardingPages[index].title
                                        .toString(),
                                    style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 14.sp,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.2.h),
                            Row(
                              children: [
                                SizedBox(
                                  width: introScreenController.size.width * 0.6,
                                  child: Text(
                                    introScreenController
                                        .onBoardingPages[index].description,
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: AppColors.grey100Color,
                                      fontWeight: FontWeight.w400,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.5.h),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ).commonSymmetricPadding(horizontal: 30, vertical: 15),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: List.generate(
                      introScreenController.onBoardingPages.length,
                      (index) => Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            color:
                                introScreenController.selectedPageIndex.value ==
                                        index
                                    ? AppColors.greenColor.withOpacity(0.4)
                                    : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: introScreenController
                                          .selectedPageIndex.value ==
                                      index
                                  ? AppColors.grey200Color
                                  : Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  // Next Button
                  GestureDetector(
                    onTap: introScreenController.forwardAction,
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      decoration: const BoxDecoration(
                        color: AppColors.greenColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Obx(
                        () => Center(
                          child: Text(
                            introScreenController.isLastPage ? "Start" : "Next",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                ],
              ).commonSymmetricPadding(horizontal: 30, vertical: 15),
            ),
          ],
        ),
      ),
    );
  }
}
