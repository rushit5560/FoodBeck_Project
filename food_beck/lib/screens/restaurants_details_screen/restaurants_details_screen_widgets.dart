import 'dart:developer';
import 'package:bottom_sheet/bottom_sheet.dart';
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
import '../../utils/widget/common_button.dart';

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
      itemCount: /*foodList.length*/ 15,
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
          onTap: () => openFoodDetailsBottomSheetModule(foodDetails),
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
                      "\$${foodDetails.price}",
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
                      onTap: () => openFoodAddonsBottomSheetModule(foodDetails),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Add',
                          style: TextStyle(
                            color: AppColors.whiteColor2,
                          ),
                        ).paddingSymmetric(horizontal: 15, vertical: 4),
                      ),
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(horizontal: 10, vertical: 8),
        );
      },
    );
  }

  void openFoodDetailsBottomSheetModule(FoodDetails foodDetails) {
    showFlexibleBottomSheet(
      bottomSheetColor: Colors.transparent,
      context: Get.context!,
      duration: const Duration(milliseconds: 500),
      isExpand: false,
      minHeight: 0,
      initHeight: 0.6,
      maxHeight: 0.6,
      // decoration: const BoxDecoration(
      //   // color: Colors.transparent,
      //   /*borderRadius: BorderRadius.only(
      //     topRight: Radius.circular(50),
      //     topLeft: Radius.circular(50),
      //   ),*/
      // ),
      builder: (
        BuildContext context,
        ScrollController scrollController,
        double bottomSheetOffset,
      ) {
        String imgUrl = ApiUrl.foodImagePathUrl + foodDetails.image;
        return ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          shrinkWrap: true,
          children: [
            Stack(
              // alignment: Alignment.center,
              children: [
                // Image Module
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                  ),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.fill,
                    height: Get.height * 0.30,
                    width: Get.width,
                    errorBuilder: (context, obj, st) {
                      return Image.asset(
                        AppImages.AppLogo,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),

                // Close button
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteColor2,
                      ),
                      child: const Icon(
                        Icons.close_rounded,
                      color: AppColors.blackColor,
                      ).paddingAll(5),
                    ),
                  ),
                ),
              ],
            ),
            // Food Description
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Food name
                            Text(
                              foodDetails.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Food price
                            Text(
                              "\$${foodDetails.price}",
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),

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
                            ).paddingSymmetric(vertical: 3),
                          ],
                        ),
                      ),

                      CustomButton(
                        text: 'Add',
                        onPressed: () => openFoodAddonsBottomSheetModule(foodDetails),
                      ),

                    ],
                  ),
                  const SizedBox(height: 5),

                  // Food Description
                 Text(
                   foodDetails.description,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 5, vertical: 5),
            ),
          ],
        );
      },
    );
  }

  void openFoodAddonsBottomSheetModule(FoodDetails foodDetails) {
    showFlexibleBottomSheet(
      context: Get.context!,
      isDismissible: false,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
          topRight: Radius.circular(25),),
        color: AppColors.whiteColor2,
      ),
      minHeight: 0,
      initHeight: 0.7,
      maxHeight: 0.7,
      duration: const Duration(milliseconds: 500),
      isExpand: false,
      bottomSheetColor: Colors.transparent,
      builder: (BuildContext context,
          ScrollController scrollController,
          double bottomSheetOffset,
      ) {

        RxDouble finalPrice = (double.parse(foodDetails.price) * screenController.itemCount.value).obs;

        return ListView(
          shrinkWrap: true,
          children: [

            Row(
              children: [
                Expanded(
                  child: Text(
                    foodDetails.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Close button
                GestureDetector(
                  onTap: () {
                    Get.back();
                    screenController.itemCount.value = 1;
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.whiteColor2,
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: AppColors.blackColor,
                    ).paddingAll(5),
                  ),
                ),
              ],
            ),

            const Divider(indent: 10, endIndent: 10),

            // const Spacer(),

            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Expanded(
                  flex: 35,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if(screenController.itemCount.value > 1) {
                              screenController.itemCount.value--;
                              finalPrice.value = double.parse(foodDetails.price) * screenController.itemCount.value;
                            }
                          },
                            child: const Icon(Icons.remove_rounded)),
                        Obx(
                          ()=> Text(
                            "${screenController.itemCount.value}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              screenController.itemCount.value++;
                              finalPrice.value = double.parse(foodDetails.price) * screenController.itemCount.value;
                            },
                            child: const Icon(Icons.add_rounded)),
                      ],
                    ).paddingSymmetric(vertical: 5),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 65,
                  child: Obx(
                      ()=> CustomButton(
                      text: "Add Item (\$$finalPrice)",
                      onPressed: () {
                        ///add to cart api calling
                      },
                    ),
                  ),
                ),

              ],
            ),

          ],
        ).paddingAll(8);
      },
    );
  }
}
