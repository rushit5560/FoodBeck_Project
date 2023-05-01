import 'package:flutter/material.dart';
import 'package:food_back/screens/cart_screen/cart_screen.dart';
import 'package:food_back/screens/profile_screen/profile_screen.dart';
import 'package:food_back/screens/search_screen/search_screen.dart';
import 'package:get/get.dart';

import '../screens/home_screen/home_screen.dart';

class IndexScreenController extends GetxController {
  RxBool isLoading = false.obs;
  var selectedIndex = 0.obs;

  List<Widget> screen = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
    // FavouriteScreen(),
  ];

  changeIndex(int index) {
    selectedIndex.value = index;
  }
}
