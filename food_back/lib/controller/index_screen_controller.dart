import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../main.dart';

class IndexScreenController extends GetxController{
  RxBool hideNavBar = false.obs;
  int light = 2;
  int dark = 1;
   BuildContext? testContext;
  PersistentTabController controller =  PersistentTabController(initialIndex: 0);
  changeColor(BuildContext context, int color) {
    if (color == light) {
      MyApp.setCustomTheme(context, 6);
    } else {
      MyApp.setCustomTheme(context, 7);
    }
  }
}