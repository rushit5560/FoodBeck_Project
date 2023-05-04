import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/discount_lable_module.dart';
import '../../constance/api_url.dart';
import '../../constance/app_images.dart';
import '../../constance/color.dart';
import '../../controller/restaurants_screen_controller.dart';
import '../../model/home_screen_model/all_restaurant_model.dart';

class AllRestaurantsShowModule extends StatelessWidget {
  List<RestaurantDetails> restaurantList;
  AllRestaurantsShowModule({Key? key, required this.restaurantList})
      : super(key: key);
  final screenController = Get.find<RestaurantsScreenController>();

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
        RestaurantDetails restaurantDetails = restaurantList[i];
        String imgUrl = ApiUrl.restaurantImagePathUrl + restaurantDetails.coverPhoto;
        // String imgUrl =
            // "https://thumbs.dreamstime.com/b/wooden-table-food-top-view-cafe-102532611.jpg";
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
                const Positioned(
                  top: 10,
                  child: DiscountLabelModule(
                    label: "10 %",
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
                        singlerestaurant: restaurantDetails,
                      )
                    : await screenController.addFavoriteRestaurantFunction(
                        restaurantId: restaurantDetails.id.toString(),
                        singlerestaurant: restaurantDetails,
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
