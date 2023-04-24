import 'package:flutter/material.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/custom_loader.dart';
import '../../controller/home_screen_controller.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  final Function(bool)? onPressed;
  HomeScreen({Key? key, this.onPressed}) : super(key: key);
  final homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => homeScreenController.isLoading.value
              ? const CustomLoader()
              : SingleChildScrollView(
                  // scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SearchbarModule(),
                      homeScreenController.bannerList.isEmpty
                      ? Container() : BannerModule(),
                      homeScreenController.categoryList.isEmpty
                      ? Container() : CategoriesModule(),
                      SizedBox(height: 2.h),
                      homeScreenController.allPopularRestaurantList.isEmpty
                      ? Container() : PopularRestaurantsModule(),
                      homeScreenController.trendingFoodList.isEmpty
                      ? Container() : TrendingFoodsModule(),
                      homeScreenController.popularFoodNearbyList.isEmpty
                      ? Container() : PopularFoodNearByModule(),
                      homeScreenController.newRestaurantList.isEmpty
                      ? Container() : NewRestaurantModule(),
                      homeScreenController.bestReviewedFoodList.isEmpty
                      ? Container() : BestReviewedFoodModule(),
                      homeScreenController.allRestaurantList.isEmpty
                      ? Container() : AllRestaurantsModule(),

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
