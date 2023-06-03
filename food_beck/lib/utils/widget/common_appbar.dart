import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/color.dart';


PreferredSizeWidget commonAppBarModule(
    {
      Color iconColor = AppColors.blackColor,
      String textFontFamily = "SFProDisplayRegular",
      Color textColor = AppColors.greyColor,
      Color backGroundColor = AppColors.whiteColor2}) {
  return AppBar(
    backgroundColor: backGroundColor,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: iconColor,
          ),
        );
      },
    ),
    elevation: 0,
  );
}
