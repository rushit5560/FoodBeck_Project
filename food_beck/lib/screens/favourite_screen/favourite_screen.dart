import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_modules/common_appbar.dart';
import '../../common_modules/custom_loader.dart';
import '../../constants/message.dart';
import '../../controllers/favorites_screen_controller.dart';
import 'favourite_screen_widgets.dart';



class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);
  final favoritesScreenController = Get.put(FavoritesScreenController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: customAppBar(titleText: "Favourites", leadingShow: false, actionShow: false),
        body: Obx(
          ()=> favoritesScreenController.isLoading.value
          ? const CustomLoader()
          : Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: AppMessage.restaurantLabel),
                  Tab(text: AppMessage.foodLabel),
                ],
                indicatorSize: TabBarIndicatorSize.tab,
              ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          favoritesScreenController.favouriteRestaurantList.isEmpty
                              ? Center(child: Text(AppMessage.noFavoriteRestaurantLabel))
                              : FavouriteRestaurantsModule(),
                          favoritesScreenController.favouriteFoodList.isEmpty
                              ? Center(child: Text(AppMessage.noFavoriteFoodLabel))
                              : FavouriteFoodsModule(),
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
