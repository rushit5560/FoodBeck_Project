import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_back/constance/app_images.dart';
import 'package:food_back/screens/authentication_screen/sign_in_screen/sign_in_screen.dart';
import 'package:food_back/screens/index_screen/index_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreenController extends GetxController {
  RxBool isLoading = false.obs;
  final size = Get.size;

   var pageController = PageController();
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;

  List<OnBoardingInfo> onBoardingPages = [];
    forwardAction() {
    if (isLastPage) {
      setOnBoardingValue();
      //Get.off(() => LoginScreen());
      Get.off(() =>  SignInScreen(),
          transition: Transition.native,
          duration: const Duration(milliseconds: 500)
      );
    } else {
      pageController.nextPage(
        duration: 300.milliseconds,
        curve: Curves.ease,
      );
    }
  }
  goToLoginScreen() => Get.offAll(() => SignInScreen());

  setOnBoardingValue() async {
    log('Call Set Value Method');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("onboarding", true);
    prefs.getBool("onboarding");
    log('Set Value : ${prefs.getBool("onboarding")}');
  }
  @override
  void onInit() {
    super.onInit();

    onBoardingPages = [
      OnBoardingInfo(
        // logo: "assets/images/foodmet_logo.png",
        logo: "food BECK",
        imageAsset: AppImages.AppLogo,

        title: 'Meet other food parents online',
        description:
            'Login from your location and communicate with other food parents locally & globally',
      ),
      OnBoardingInfo(
        // logo: "assets/images/foodmet_logo.png",
        logo: "food BECK",
        imageAsset: AppImages.AppLogo,

        title: 'Find food shops, doctors, ngos & trainers on a single tap',
        description:
            'Easy to access and locate essential daily needs of foods nearby!!',
      ),
      OnBoardingInfo(
        // logo: "assets/images/foodmet_logo.png",
        logo: "food BECK",
        imageAsset: AppImages.AppLogo,
        title: 'Learn food parenting a better way!!',
        description:
            'An easy solution for new food parents to understand their foods a better way.',
      ),
    ];
  }
}

class OnBoardingInfo {
  final logo;
  final imageAsset;
  final title;
  final description;

  OnBoardingInfo({
    this.logo,
    this.imageAsset,
    this.title,
    this.description,
  });
}
