import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_modules/custom_loader.dart';
import '../../controllers/search_screen_controller.dart';
import 'search_screen_widgets.dart';

class SearchScreen extends StatelessWidget {
  // final  Function(bool)? onPressed;
  SearchScreen({Key? key}) : super(key: key);
  final searchScreenController = Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                SearchbarModule().paddingSymmetric(horizontal: 5, vertical: 10),


                Obx(
                  () => searchScreenController.isLoading.value
                      ? const Expanded(
                        child: Center(child: CustomLoader()),
                      )
                      : searchScreenController.searchFieldController.text
                              .trim()
                              .isEmpty
                          ? const Expanded (child: Center(child: Text('Search')))
                          : Expanded(
                              child: Obx(
                                () => searchScreenController.isLoading.value
                                    ? const Center(child: CustomLoader())
                                    : Column(
                                        children: [
                                          const TabBar(
                                            tabs: [
                                              Tab(text: "Restaurants"),
                                              Tab(text: "Foods"),
                                            ],
                                            indicatorSize: TabBarIndicatorSize.tab,
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              children: [
                                                searchScreenController
                                                        .restaurantList.isEmpty
                                                    ? const Center(
                                                        child: Text(
                                                            'Restaurant not available'))
                                                    : RestaurantsShowModule(
                                                        restaurantList:
                                                            searchScreenController
                                                                .restaurantList),

                                                searchScreenController
                                                        .foodList.isEmpty
                                                    ? const Center(
                                                        child: Text(
                                                            'Food not available'))
                                                    // : RestaurantsShowModule(restaurantList: searchScreenController.restaurantList),
                                                : FoodsShowModule(foodList: searchScreenController.foodList),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
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
