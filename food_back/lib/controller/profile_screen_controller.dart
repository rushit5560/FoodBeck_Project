import 'dart:developer';
import 'package:get/get.dart';

import '../constance/app_images.dart';
import '../model/profile_screen_model/main_category_model.dart';
import '../screens/terms_conditins_screen/terms_conditins_screen.dart';


class ProfileScreenController extends GetxController {
  List<ProfileCategory> selectList = [
    ProfileCategory(image: AppImages.i4, name: "Terms & Conditions"),
  ];

  void optionProfileClickFunction(int index) {
    if (index == 0) {
      Get.to(
            () => TermsAndConditionsScreen(),
      );
    }
  }
}