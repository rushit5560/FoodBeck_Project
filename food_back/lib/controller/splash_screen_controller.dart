import 'dart:async';
import 'dart:developer';
import 'package:food_back/screens/authentication_screen/sign_in_screen/sign_in_screen.dart';
import 'package:food_back/screens/index_screen/index_screen.dart';
import 'package:get/get.dart';
import '../utils/user_preferences.dart';

class SplashScreenController extends GetxController {
  RxBool isLoading = false.obs;

  RxBool isUserLoggedInStatus = false.obs;
  UserPreference userPreference = UserPreference();

  startTimer() async {
    Timer(
      const Duration(milliseconds: 3000),
      () {
        if (isUserLoggedInStatus.value) {
          log("login");
          Get.to(() => IndexScreen());
        } else {
          Get.to(() => SignInScreen());
        }
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
