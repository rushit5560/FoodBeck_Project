import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constance/app_images.dart';

class RecipesScreenController extends GetxController{
  TextEditingController searchbarController = TextEditingController();
  List<String> list = [
    AppImages.home1,
    AppImages.home2,
    AppImages.home3,
    AppImages.home4,
    AppImages.home5,
    AppImages.home6,
  ];
}