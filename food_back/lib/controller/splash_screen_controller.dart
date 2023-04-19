import 'dart:async';
import 'package:get/get.dart';

import '../screens/Introduction_screen/Introduction_screen.dart';

class SplashScreenController extends GetxController {
  startTimer() async {
    Timer(
      const Duration(milliseconds: 3000),
      () {
        Get.to(IntroductionScreen());
      },
    );
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }
}
