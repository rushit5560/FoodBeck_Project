import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionScreenController extends GetxController{
  RxBool isLoading = false.obs;
  int selectedPage = 0;
  final PageController pageController = PageController();
}