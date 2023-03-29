import 'dart:async';
import 'package:food_back/screens/authentication_screen/login_screen/login_screen.dart';
import 'package:get/get.dart';
import '../screens/authentication_screen/sign_up_screen/sign_up_screen.dart';

class SplashScreenController extends GetxController {
  startTimer() async {
    Timer(
      const Duration(milliseconds: 3000),
      () {
        Get.to(LoginScreen());
      },
    );
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }
}
