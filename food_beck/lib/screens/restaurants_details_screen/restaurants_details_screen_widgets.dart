import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_beck/constants/color.dart';
import 'package:get/get.dart';
import '../../common_modules/discount_label_module.dart';
import '../../constants/api_url.dart';
import '../../constants/app_images.dart';
import '../../controllers/restaurants_details_screen_controller.dart';
import '../../models/restaurants_details_screen_model/restaurant_food_model.dart';

class RestaurantLogoAndNameModule extends StatelessWidget {
  RestaurantLogoAndNameModule({Key? key}) : super(key: key);
  final screenController = Get.find<RestaurantsDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              screenController.restaurantLogo,
              fit: BoxFit.cover,
              errorBuilder: (context, obj, st) {
                return Image.asset(
                  AppImages.AppLogo,
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Text(
                screenController.restaurantName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),*/
              Text(
                screenController.restaurantDescription,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10),
              ),
              const SizedBox(height: 1),
              /*RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: "Address",
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: screenController.restaurantAddress,
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),*/
              Text(
                screenController.restaurantAddress,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        // const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.heart),
        )
      ],
    );
  }
}

class RestaurantRatingModule extends StatelessWidget {
  RestaurantRatingModule({Key? key}) : super(key: key);
  final screenController = Get.find<RestaurantsDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.star_fill,
                    size: 13,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    screenController.ratingCount.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Text(
                "${screenController.overallRating} Ratings",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.location_solid,
                size: 16,
                color: Colors.amber,
              ),
              SizedBox(height: 3),
              Text(
                "Location",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.stopwatch_fill,
                    size: 13,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    screenController.deliveryTime,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              const Text(
                "Delivery Time",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AllFoodShowModule extends StatelessWidget {
  List<FoodDetails> foodList;

  AllFoodShowModule({Key? key, required this.foodList}) : super(key: key);
  final screenController = Get.find<RestaurantsDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: /*foodList.length*/15,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(indent: 100, endIndent: 15);
      },
      itemBuilder: (context, i) {
        FoodDetails foodDetails = foodList[0];
        String imgUrl = ApiUrl.foodImagePathUrl + foodDetails.image;
        // String imgUrl = "https://thumbs.dreamstime.com/b/wooden-table-food-top-view-cafe-102532611.jpg";
        return GestureDetector(
          onTap: () {
          },
          child: Row(
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
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(msg: "Clicked On Favourite!");
                      },
                      child: const Icon(CupertinoIcons.heart)),
                  const SizedBox(height: 20),
                  GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(msg: "Clicked On add!");
                      },
                      child: const Icon(CupertinoIcons.add)),
                ],
              ),
            ],
          ).paddingSymmetric(horizontal: 10, vertical: 8),
        );
      },
    );
  }



}
