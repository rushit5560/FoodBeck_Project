import 'dart:developer';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_back/constance/api_url.dart';
import 'package:food_back/constance/color.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';

import '../constance/app_images.dart';
import '../model/home_screen_model/food_details_model.dart';
import 'discount_lable_module.dart';

class FoodDetailsBottomSheetModule {
  RxInt qty = 1.obs;
  RxDouble totalPrice = 0.0.obs;


  void foodDetailsBottomSheet({required FoodData foodData}) {
    showFlexibleBottomSheet(
      context: Get.context!,
      minHeight: 0,
      maxHeight: 0.8,
      isExpand: true,
      isCollapsible: true,
      isSafeArea: true,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        
      ),
      builder: (
        BuildContext context,
        ScrollController scrollController,
        double bottomSheetOffset,
      ) {
        // String imgUrl = ApiUrl.foodImagePathUrl + foodData.image!;
        String imgUrl =
            "https://thumbs.dreamstime.com/b/wooden-table-food-top-view-cafe-102532611.jpg";
        String discountType = foodData.discountType! == "amount" ? "\$" : "%";
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image & Header
            Row(
              children: [
                /// Food Image Module
                Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
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
                        label: "${foodData.discount} $discountType OFF",
                        labelShowRightSide: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 5),

                /// Food Details Module
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.greenColor,
                          ),
                          child: Text(
                            foodData.veg! == 1 ? "Veg" : "Non-Veg",
                            maxLines: 1,
                            // textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ).commonSymmetricPadding(horizontal: 10, vertical: 5),
                        ),
                      ),
                      Text(
                        "${foodData.name}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        "Restaurant Name",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14, color: AppColors.greenColor),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: double.parse(foodData.rating!),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemSize: 17,
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
                          Text(
                            "(${foodData.rating})",
                            style: const TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Text(
                            "\$${foodData.price}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ).commonAllSidePadding(5),

            // Description
            const Text(
              "Description",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${foodData.description}",
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14),
            ),




          ],
        ).commonAllSidePadding(10);
      },
    );
  }
}
