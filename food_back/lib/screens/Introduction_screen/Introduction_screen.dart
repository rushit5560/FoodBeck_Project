import 'package:flutter/material.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';

import '../../constance/color.dart';
import '../../controller/introduction_screen_controller.dart';
import 'Introduction_screen_widgets.dart';

class IntroductionScreen extends StatelessWidget {
   IntroductionScreen({Key? key}) : super(key: key);
final introductionScreenController = Get.put(IntroductionScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteColor2,
      body: IntroductionModule().commonSymmetricPadding(vertical: 15),
    );
  }
}
