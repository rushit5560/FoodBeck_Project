import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_back/common_modules/common_appbar.dart';
import 'package:food_back/common_modules/custom_loader.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';
import '../../common_modules/discount_lable_module.dart';
import '../../constance/app_images.dart';
import '../../constance/color.dart';
import '../../controller/food_details_screen_controller.dart';
import 'food_details_screen_widgets.dart';


class FoodDetailsScreen extends StatelessWidget {
  FoodDetailsScreen({Key? key}) : super(key: key);
  final foodDetailsScreenController = Get.put(FoodDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(titleText: "Food Details", leadingShow: false, actionShow: false),
      body: Obx(
        () => foodDetailsScreenController.isLoading.value
        ? const CustomLoader()
        : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          FoodImageModule().commonAllSidePadding(10),
                          FoodNameAndBasicDetails().commonOnlyPadding(
                              left: 10, right: 10, bottom: 5),
                          FoodQuantityModule().commonOnlyPadding(
                              left: 10, right: 10, bottom: 10),
                          // FoodTotalAmountModule().commonOnlyPadding(left: 10, right: 10, bottom: 10),
                        ],
                      ),
                    ),
                  ),

                  // At the end
                  StoreButtonAndCartButtonModule(),

                  /*Row(
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
                          foodDetailsScreenController.imageUrl,
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
                        label: "${foodDetailsScreenController.selectedFoodData.discount} ${foodDetailsScreenController.selectedFoodData.discountType} OFF",
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
                            foodDetailsScreenController.selectedFoodData.veg! == 1 ? "Veg" : "Non-Veg",
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
                        "${foodDetailsScreenController.selectedFoodData.name}",
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
                            initialRating: double.parse(foodDetailsScreenController.selectedFoodData.rating!),
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
                            "(${foodDetailsScreenController.selectedFoodData.rating})",
                            style: const TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Text(
                            "\$${foodDetailsScreenController.selectedFoodData.price}",
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
            ).commonAllSidePadding(5),*/

                  // Description
                  /*const Text(
              "Description",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${foodDetailsScreenController.selectedFoodData.description}",
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14),
            ),*/
                ],
              ),
      ),
    );
  }
}
