import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_images.dart';
import '../screens/authentication_screens/sign_in_screen/sign_in_screen.dart';
import '../utils/user_preferences.dart';


class OnboardingScreenController extends GetxController {
  RxBool isLoading = false.obs;
  final size = Get.size;
   var pageController = PageController();
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;
  UserPreference userPreference = UserPreference();

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
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    userPreference.setBoolValueInPrefs(
        key: UserPreference.isUserOnBoardingKey, value: true);
    // prefs.setBool("setOnBoardingValue", true);
    // prefs.getBool("setOnBoardingValue");
    // log('Set Value : ${prefs.getBool("setOnBoardingValue")}');
  }
  @override
  void onInit() {
    super.onInit();

    onBoardingPages = [
      OnBoardingInfo(
        // logo: "assets/images/foodmet_logo.png",
        logo: "Food Back",
        imageAsset: AppImages.AppLogo,

        title: 'Meet other food parents online',
        description:
            'Login from your location and communicate with other food parents locally & globally',
      ),
      OnBoardingInfo(
        // logo: "assets/images/foodmet_logo.png",
        logo: "Food Back",
        imageAsset: AppImages.AppLogo,

        title: 'Find food shops, doctors, ngos & trainers on a single tap',
        description:
            'Easy to access and locate essential daily needs of foods nearby!!',
      ),
      OnBoardingInfo(
        // logo: "assets/images/foodmet_logo.png",
        logo: "Food Back",
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
