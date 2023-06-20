

import 'package:flutter/material.dart';

import '../constants/color.dart';

ThemeData appThemeData = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: AppColors.whiteColor2,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    dividerColor: Colors.transparent,
    indicatorColor: AppColors.greenColor,
    labelColor: AppColors.greenColor,
    unselectedLabelColor: AppColors.greyColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: AppColors.greenColor,
    ),
    selectedLabelStyle: TextStyle(color: AppColors.greenColor),
  ),
);