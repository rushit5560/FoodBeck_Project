import 'package:flutter/material.dart';
import 'package:food_beck/utils/style.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/custom_loader.dart';
import '../../controllers/home_screen_controller.dart';
import '../location_screen/location_screen.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  final Function(bool)? onPressed;

  HomeScreen({Key? key, this.onPressed}) : super(key: key);
  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: customAppBar(titleText: "FoodBeck", leadingShow: false, actionShow: false),
      body: SafeArea(
        child: Obx(
          () => homeScreenController.isLoading.value
              ? const CustomLoader()
              : SingleChildScrollView(
                  // scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      // SearchbarModule(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(() => LocationScreen());
                            },
                            icon: const Icon(Icons.location_on),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => LocationScreen());
                              },
                              child: Text(
                                homeScreenController.address.value,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyleConfig.textStyle(),
                              ),
                            ),
                          ),
                          // IconButton(
                          //     onPressed: () {},
                          //     icon: const Icon(Icons.notifications))
                        ],
                      ).paddingSymmetric(horizontal: 10),
                      homeScreenController.bannerList.isEmpty
                          ? Container()
                          : BannerModule(),
                      homeScreenController.categoryList.isEmpty
                          ? Container()
                          : CategoriesModule(),
                      SizedBox(height: 2.h),
                      homeScreenController.allPopularRestaurantList.isEmpty
                          ? Container()
                          : PopularRestaurantsModule(),
                      homeScreenController.trendingFoodList.isEmpty
                          ? Container()
                          : TrendingFoodsModule(),
                      homeScreenController.cuisinesList.isEmpty
                          ? Container()
                          : CuisineListModule(),
                      homeScreenController.popularFoodNearbyList.isEmpty
                          ? Container()
                          : PopularFoodNearByModule(),
                      homeScreenController.newRestaurantList.isEmpty
                          ? Container()
                          : NewRestaurantModule(),
                      homeScreenController.bestReviewedFoodList.isEmpty
                          ? Container()
                          : BestReviewedFoodModule(),
                      homeScreenController.allRestaurantList.isEmpty
                          ? Container()
                          : AllRestaurantsModule(),

                      // TakeYourPickModule(),
                      // BreakfastModule(),
                      // SnackModule(),
                      // LunchModule(),
                      // DinnerModule(),
                    ],
                  ),
                ).paddingSymmetric(vertical: 10),
        ),
      ),
    );
  }
}
