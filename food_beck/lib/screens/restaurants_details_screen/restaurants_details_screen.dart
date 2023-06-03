import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_modules/custom_loader.dart';
import '../../constants/app_images.dart';
import '../../constants/color.dart';
import '../../controllers/restaurants_details_screen_controller.dart';
import 'restaurants_details_screen_widgets.dart';

class RestaurantsDetailsScreen extends StatelessWidget {
  RestaurantsDetailsScreen({super.key});

  final restaurantsDetailsScreenController =
      Get.put(RestaurantsDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Obx(
          () => restaurantsDetailsScreenController.isLoading.value
              ? const CustomLoader()
              : NestedScrollView(
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      backgroundColor: AppColors.greenColor,
                      elevation: 0,
                      floating: true,
                      snap: true,
                      pinned: true,
                      expandedHeight: 250,

                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),

                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // color: AppColors.greenColor,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                      ).paddingOnly(left: 10),
                      actions: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // color: AppColors.greenColor,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                            ),
                          ),
                        ).paddingOnly(right: 10),
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(restaurantsDetailsScreenController.restaurantName),
                        // collapseMode: CollapseMode.parallax,
                        background: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                          child: Image.network(
                            restaurantsDetailsScreenController.coverImage,
                            fit: BoxFit.cover,
                            errorBuilder: (context, obj, st) {
                              return Image.asset(AppImages.AppLogo);
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                  body: Column(
                    children: [
                      RestaurantLogoAndNameModule()
                          .paddingSymmetric(horizontal: 10, vertical: 10),
                      RestaurantRatingModule(),
                      const TabBar(
                        tabs: [
                          Tab(text: "All"),
                          Tab(text: "Veg"),
                          Tab(text: "Non-Veg"),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          dragStartBehavior: DragStartBehavior.start,
                          children: [
                            restaurantsDetailsScreenController.allFoodList.isEmpty
                                ? const Center(child: Text('Food not available'))
                                : AllFoodShowModule(
                                    foodList: restaurantsDetailsScreenController.allFoodList,
                                  ),
                            restaurantsDetailsScreenController.vegFoodList.isEmpty
                                ? const Center(child: Text('Veg food not available'))
                                : AllFoodShowModule(
                                    foodList: restaurantsDetailsScreenController.vegFoodList,
                                  ),
                            restaurantsDetailsScreenController.nonVegFoodList.isEmpty
                                ? const Center(child: Text('Non-veg food not available'))
                                : AllFoodShowModule(
                                    foodList: restaurantsDetailsScreenController.nonVegFoodList,
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
