import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/index_screen/index_screen.dart';
import '../screens/onboarding_screen/onboarding_screen.dart';
import '../utils/user_preferences.dart';

class SplashScreenController extends GetxController {
  RxBool isLoading = false.obs;

  RxBool isUserLoggedInStatus = false.obs;
  UserPreference userPreference = UserPreference();

  startTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool onboardingValue = prefs.getBool('onboarding') ?? false;

    Timer(
      const Duration(milliseconds: 3000),
      () {
        if (onboardingValue == false) {
          Get.offAll(
            () => OnboardingScreen(),
            transition: Transition.native,
          );
        } else if (isUserLoggedInStatus.value == true) {
          Get.offAll(
            () => IndexScreen(),
            transition: Transition.native,
          );
          log("isUserLoggedInStatus.value ${isUserLoggedInStatus.value}");
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
    await startTimer();
    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
}
