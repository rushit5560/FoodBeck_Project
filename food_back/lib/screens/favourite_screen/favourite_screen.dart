import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance/color.dart';
import '../../constance/message.dart';

class FavouriteScreen extends StatelessWidget {
  final Function(bool)? onPressed;
  const FavouriteScreen({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppMessage.favofavorite,
          style: const TextStyle(color: AppColors.blackColor),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.blackColor,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
      ),
      body: Column(

        
      ),
    );
  }
}
