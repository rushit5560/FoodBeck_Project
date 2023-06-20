import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/index_screen/index_screen.dart';
import '../screens/onboarding_screen/onboarding_screen.dart';
import '../utils/user_preferences.dart';

class SplashScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isUserLoggedInStatus = false.obs;
  UserPreference userPreference = UserPreference();

  RxBool isOnBoardingValue = false.obs;


  startTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool onBoardingValue = prefs.getBool('onBoarding') ?? false;
    // log("prefs.getBool 111 ${prefs.getBool("onBoarding")}");
    log("isOnBoardingValue.value ${isOnBoardingValue.value}");

    Timer(
      const Duration(milliseconds: 1500),
      () {
log("isOnBoardingValue.value ${isOnBoardingValue.value}");

        if (isOnBoardingValue.value == false) {
          Get.offAll(
            () => OnboardingScreen(),
            transition: Transition.native,
          );
          log("onBoardingValue $onBoardingValue");
        } else if (isUserLoggedInStatus.value == true) {
          Get.offAll(
            () => IndexScreen(),
            transition: Transition.native,
          );
          log("isUserLoggedInStatus.value 22 ${isUserLoggedInStatus.value}");
        }

        // else if (isUserLoggedInStatus.value == false) {
        //   Get.offAll(
        //     () => SignInScreen(),
        //     transition: Transition.native,
        //   );
        //   log("isUserLoggedInStatus.value ${isUserLoggedInStatus.value}");
        // }
        // if (isUserLoggedInStatus.value) {
        //   log("login");
        //   Get.to(() => IndexScreen());
        // } else {
        //   Get.to(() => SignInScreen());
        // }
      },
    );
  }

  Future<void> initMethod() async {
    isLoading(true);
    isUserLoggedInStatus.value = await userPreference.getBoolFromPrefs(
        key: UserPreference.isUserLoggedInKey);
    log('isUserLoggedInStatus.value : ${isUserLoggedInStatus.value}');

   isOnBoardingValue.value = await userPreference.getBoolFromPrefs(
        key: UserPreference.isUserOnBoardingKey);
    log('isUserOnBoardingKey.value : ${isOnBoardingValue.value}');
    await startTimer();
    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
}
