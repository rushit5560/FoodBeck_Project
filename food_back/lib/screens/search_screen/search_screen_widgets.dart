import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/discount_lable_module.dart';
import '../../constance/app_images.dart';
import '../../constance/color.dart';
import '../../controller/search_screen_controller.dart';
import '../../model/search_screen_model/search_model.dart';


class SearchbarModule extends StatelessWidget {
  final void Function(bool)? onPressed;

  SearchbarModule({Key? key, this.onPressed}) : super(key: key);
  final screenController = Get.find<SearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).colorScheme.background,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Theme.of(context).dividerColor,
                  ),
                  child: TextFormField(
                    controller: screenController.searchFieldController,
                    onChanged: (value) {
                      if(value.isEmpty) {
                        screenController.clearAllList();
                      }
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none,
                      hintText: 'Find something...',
                    ),
                  ),
                ).commonOnlyPadding(right: 12),
              ),
              Container(
                //padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).primaryColor,
                ),
                child: IconButton(
                  onPressed: () {
                    //log('message');
                    screenController.searchButtonClickFunction();
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ).commonOnlyPadding(left: 10, right: 10),
        // InkWell(
        //   onTap: () {
        //     Get.to(() => FoodScreen());
        //   },
        //
        // ),
      ],
    );
  }
}

class RestaurantsShowModule extends StatelessWidget {
  List<Restaurant> restaurantList;
  RestaurantsShowModule({Key? key, required this.restaurantList})
      : super(key: key);
  final screenController = Get.find<SearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: restaurantList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(indent: 100, endIndent: 15);
      },
      itemBuilder: (context, i) {
        Restaurant restaurantDetails = restaurantList[i];
        // String imgUrl = ApiUrl.restaurantImagePathUrl + restaurantDetails.coverPhoto;
        String imgUrl =
            "https://thumbs.dreamstime.com/b/wooden-table-food-top-view-cafe-102532611.jpg";

        // String discountType = restaurantDetails.d == "amount" ? "\$" : "%";
        return Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.fill,
                      errorBuilder: (context, obj, st) {
                        return Image.asset(
                          AppImages.AppLogo,
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                ),
                /*const Positioned(
                  top: 10,
                  child: DiscountLabelModule(
                    label: "10 %",
                    labelShowRightSide: false,
                  ),
                ),*/
              ],
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    restaurantDetails.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    restaurantDetails.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 10),
                  ),
                  const SizedBox(height: 1),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 3.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        itemSize: 12,
                        itemCount: 5,
                        itemPadding:
                        const EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        onRatingUpdate: (rating) {
                          log("$rating");
                        },
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "(3.5)",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () async {
                // Fluttertoast.showToast(
                //     msg: "Clicked On Favourite!");
                restaurantDetails.isFav == true
                    ? await screenController.removeFavoriteRestaurantFunction(
                  restaurantId: restaurantDetails.id.toString(),
                  singleRestaurant: restaurantDetails,
                )
                    : await screenController.addFavoriteRestaurantFunction(
                  restaurantId: restaurantDetails.id.toString(),
                  singleRestaurant: restaurantDetails,
                );
              },
              child: Icon(
                restaurantDetails.isFav == true
                    ? Icons.favorite_rounded
                    : Icons.favorite_outline_rounded,
                color: restaurantDetails.isFav == true
                    ? AppColors.redColor
                    : AppColors.blackColor,
                size: 18.sp,
              ),
            ),
          ],
        ).commonSymmetricPadding(horizontal: 10, vertical: 8);
      },
    );
  }
}

class FoodsShowModule extends StatelessWidget {
  List<Food> foodList;
  FoodsShowModule({Key? key, required this.foodList})
      : super(key: key);
  final screenController = Get.find<SearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: foodList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(indent: 100, endIndent: 15);
      },
      itemBuilder: (context, i) {
        Food foodDetails = foodList[i];
        // String imgUrl = ApiUrl.restaurantImagePathUrl + restaurantDetails.coverPhoto;
        String imgUrl =
            "https://thumbs.dreamstime.com/b/wooden-table-food-top-view-cafe-102532611.jpg";

        String discountType = foodDetails.discountType == "amount" ? "\$" : "%";
        return Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.fill,
                      errorBuilder: (context, obj, st) {
                        return Image.asset(
                          AppImages.AppLogo,
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  child: DiscountLabelModule(
                    label: "${foodDetails.discount} $discountType OFF",
                    labelShowRightSide: false,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    foodDetails.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    foodDetails.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 10),
                  ),
                  const SizedBox(height: 1),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 3.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        itemSize: 12,
                        itemCount: 5,
                        itemPadding:
                        const EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        onRatingUpdate: (rating) {
                          log("$rating");
                        },
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "(3.5)",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  const SizedBox(height: 1),
                  Text(
                    "\$${foodDetails.price}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: () async {
                    Fluttertoast.showToast(
                        msg: "Clicked On Favourite!");
                    // foodDetails.isFav == true
                    //     ? await screenController.removeFavoriteRestaurantFunction(
                    //   restaurantId: restaurantDetails.id.toString(),
                    //   singleRestaurant: restaurantDetails,
                    // )
                    //     : await screenController.addFavoriteRestaurantFunction(
                    //   restaurantId: restaurantDetails.id.toString(),
                    //   singleRestaurant: restaurantDetails,
                    // );
                  },
                  child: Icon(
                    Icons.favorite_outline_rounded,
                    // color: AppColors.blackColor,
                    // restaurantDetails.isFav == true
                    //     ? Icons.favorite_rounded
                    //     : Icons.favorite_outline_rounded,
                    // color: restaurantDetails.isFav == true
                    //     ? AppColors.redColor
                    //     : AppColors.blackColor,
                    size: 18.sp,
                  ),
                ),
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () async {
                    Fluttertoast.showToast(
                        msg: "Clicked On Add!");
                    // foodDetails.isFav == true
                    //     ? await screenController.removeFavoriteRestaurantFunction(
                    //   restaurantId: restaurantDetails.id.toString(),
                    //   singleRestaurant: restaurantDetails,
                    // )
                    //     : await screenController.addFavoriteRestaurantFunction(
                    //   restaurantId: restaurantDetails.id.toString(),
                    //   singleRestaurant: restaurantDetails,
                    // );
                  },
                  child: Icon(
                    Icons.add_rounded,
                    // color: AppColors.blackColor,
                    // restaurantDetails.isFav == true
                    //     ? Icons.favorite_rounded
                    //     : Icons.favorite_outline_rounded,
                    // color: restaurantDetails.isFav == true
                    //     ? AppColors.redColor
                    //     : AppColors.blackColor,
                    size: 18.sp,
                  ),
                ),
              ],
            ),
          ],
        ).commonSymmetricPadding(horizontal: 10, vertical: 8);
      },
    );
  }
}