import 'package:flutter/material.dart';
import 'package:food_back/screens/recipes_screen/home_screen_widgets.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/custom_loader.dart';
import '../../controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  final Function(bool)? onPressed;
  HomeScreen({Key? key, this.onPressed}) : super(key: key);
  final recipesScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => recipesScreenController.isLoading.value
              ? const CustomLoader()
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SearchbarModule(),
                      BannerModule(),
                      CategoriesModule(),
                      SizedBox(height: 2.h),
                      PopularRestaurantsModule(),
                      // TakeYourPickModule(),
                      // BreakfastModule(),
                      // SnackModule(),
                      // LunchModule(),
                      // DinnerModule(),
                    ],
                  ),
                ).commonSymmetricPadding(vertical: 10),
        ),
      ),
    );
  }
}
