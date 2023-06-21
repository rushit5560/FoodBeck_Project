import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_modules/common_appbar.dart';
import '../../common_modules/custom_loader.dart';
import '../../controllers/foods_screen_controller.dart';
import 'foods_screen_widgets.dart';

class FoodsScreen extends StatelessWidget {
  FoodsScreen({Key? key}) : super(key: key);
  final foodsScreenController = Get.put(FoodsScreenController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
        child: Scaffold(
          appBar: customAppBar(
            titleText: foodsScreenController.headerName,
            actionShow: false,
            leadingShow: false,
          ),

          body: Obx(
              ()=> foodsScreenController.isLoading.value
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
                          foodsScreenController.allFoodsList.isEmpty
                              ? const Center(child: Text('Food not available'))
                              : FoodListShowModule(foodsList: foodsScreenController.allFoodsList),

                          foodsScreenController.vegFoodsList.isEmpty
                          ? const Center(child: Text('Veg Food not available'))
                              : FoodListShowModule(foodsList: foodsScreenController.vegFoodsList),

                          foodsScreenController.nonVegFoodsList.isEmpty
                              ? const Center(child: Text('Non-Veg Food not available'))
                              : FoodListShowModule(foodsList: foodsScreenController.nonVegFoodsList),
                        ],
                      ),
                    ),
                  ],
              ),
          ),
        ),
    );
  }
}
