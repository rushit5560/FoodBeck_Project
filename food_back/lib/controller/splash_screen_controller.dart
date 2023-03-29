import 'dart:async';
import 'package:get/get.dart';
import '../screens/sign_up_screen/sign_up_screen.dart';

class SplashScreenController extends GetxController{
  startTimer() async {
    Timer(
      const Duration(milliseconds: 1500),
          ()  {
        Get.to(SignUpScreen());
      },
    );
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }
}
