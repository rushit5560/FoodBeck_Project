import 'package:flutter/material.dart';
import 'package:food_back/common_modules/custom_loader.dart';
import 'package:get/get.dart';
import '../../common_modules/common_appbar.dart';
import '../../controller/restaurants_screen_controller.dart';
import 'restaurants_screen_widgets.dart';


class RestaurantsScreen extends StatelessWidget {
  RestaurantsScreen({Key? key}) : super(key: key);
  final restaurantsScreenController = Get.put(RestaurantsScreenController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: customAppBar(
          titleText: restaurantsScreenController.categoryName,
          actionShow: false,
          leadingShow: false,
        ),
        body: Obx(
          () => restaurantsScreenController.isLoading.value
              ? const CustomLoader()
              : Column(
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(text: "All"),
                        Tab(text: "Veg"),
                        Tab(text: "Non-Veg"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          restaurantsScreenController.allRestaurantList.isEmpty
                          ? const Center(child: Text('Restaurant not available'))
                          : AllRestaurantsShowModule(
                            restaurantList:
                                restaurantsScreenController.allRestaurantList,
                          ),

                          restaurantsScreenController.vegRestaurantList.isEmpty
                          ? const Center(child: Text('Veg restaurant not available'))
                          : AllRestaurantsShowModule(
                            restaurantList:
                                restaurantsScreenController.vegRestaurantList,
                          ),

                          restaurantsScreenController.nonVegRestaurantList.isEmpty
                          ? const Center(child: Text('Non-veg restaurant not available'))
                          : AllRestaurantsShowModule(
                            restaurantList: restaurantsScreenController
                                .nonVegRestaurantList,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
