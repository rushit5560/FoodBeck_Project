import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/index_screen/index_screen.dart';
import '../screens/location_screen/location_screen.dart';
import '../screens/onboarding_screen/onboarding_screen.dart';
import '../utils/user_preferences.dart';

class SplashScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isUserLoggedInStatus = false.obs;
  UserPreference userPreference = UserPreference();
  RxBool isUserLocationStatus = false.obs;

  RxBool isOnBoardingValue = false.obs;

  startTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool onBoardingValue = prefs.getBool('onBoarding') ?? false;
    // log("prefs.getBool 111 ${prefs.getBool("onBoarding")}");

    Timer(
      const Duration(milliseconds: 1500),
      () {
        log("isOnBoardingValue.value ${isOnBoardingValue.value}");
        // log("isUserLocationStatus.value ${isUserLocationStatus.value}");
        log("isUserLoggedInStatus.value ${isUserLoggedInStatus.value}");

        if (isOnBoardingValue.value == false) {
          Get.offAll(
            () => OnboardingScreen(),
            transition: Transition.native,
          );
        }
        // else if (isUserLocationStatus.value == false) {
        //   Get.to(
        //     () => LocationScreen(),
        //     transition: Transition.native,
        //   );
        // }
        else if (isUserLoggedInStatus.value == true) {
          Get.offAll(
            () => IndexScreen(),
            transition: Transition.native,
          );
        }
        // else {
        //   Get.offAll(
        //     () => IndexScreen(),
        //     transition: Transition.native,
        //   );
        // }

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
    // isUserLocationStatus.value = await userPreference.getBoolFromPrefs(
    //     key: UserPreference.isUserLocationKey);
    // log('isUserLocationStatus.value 11111 : ${isUserLocationStatus.value}');
    await startTimer();
    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
}
