import 'package:flutter/material.dart';
import 'package:food_back/common_modules/common_appbar.dart';
import 'package:food_back/common_modules/custom_loader.dart';
import 'package:get/get.dart';
import '../../controller/favorites_screen_controller.dart';



class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);
  final favoritesScreenController = Get.put(FavoritesScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(titleText: "Favourites", leadingShow: false, actionShow: false),
      // appBar: AppBar(
      //   title: Text(
      //     AppMessage.favofavorite,
      //     style: const TextStyle(color: AppColors.blackColor),
      //   ),
      //   elevation: 0,
      //   leading: IconButton(
      //     onPressed: () {
      //       Get.back();
      //     },
      //     icon: const Icon(
      //       Icons.arrow_back_ios,
      //       color: AppColors.blackColor,
      //     ),
      //   ),
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       bottomRight: Radius.circular(25),
      //       bottomLeft: Radius.circular(25),
      //     ),
      //   ),
      // ),
      body: Obx(
        ()=> favoritesScreenController.isLoading.value
        ? const Center(child: CustomLoader())
        : Column(
          children: [],
        ),
      ),
    );
  }
}
