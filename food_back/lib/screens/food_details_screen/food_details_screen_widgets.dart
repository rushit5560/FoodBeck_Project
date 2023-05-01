import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';

import '../../common_modules/discount_lable_module.dart';
import '../../constance/app_images.dart';
import '../../constance/color.dart';
import '../../controller/food_details_screen_controller.dart';

class FoodImageModule extends StatelessWidget {
  FoodImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<FoodDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    String discountType = screenController.selectedFoodData.discountType! == "amount" ? "\$" : "%";

    return Stack(
      children: [
        Container(
          height: Get.size.height * 0.25,
          width: Get.size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              // screenController.imageUrl,
              "https://thumbs.dreamstime.com/b/wooden-table-food-top-view-cafe-102532611.jpg",
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
            label: "${screenController.selectedFoodData.discount} $discountType OFF",
            labelShowRightSide: false,
            fontSize: 12,
          ),
        ),

        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: screenController.selectedFoodData.veg! == 1 ? AppColors.greenColor
              : AppColors.redColor,
            ),
            child: Text(
              screenController.selectedFoodData.veg! == 1 ? "Veg" : "Non-Veg",
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
      ],
    );
  }
}

class FoodNameAndBasicDetails extends StatelessWidget {
  FoodNameAndBasicDetails({Key? key}) : super(key: key);
  final screenController = Get.find<FoodDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "${screenController.selectedFoodData.name}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3),

        const Text(
          "Restaurant Name",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 15, color: AppColors.greenColor),
        ),
        const SizedBox(height: 3),

        Row(
          children: [
            RatingBar.builder(
              initialRating: double.parse(screenController.selectedFoodData.rating!),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              ignoreGestures: true,
              itemSize: 19,
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
              "(${screenController.selectedFoodData.rating})",
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
        const SizedBox(height: 3),

        Text(
          "\$${screenController.selectedFoodData.price}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        // const SizedBox(height: 3),
        const Divider(thickness: 1),
        // const SizedBox(height: 3),
        const Text(
          "Description",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${screenController.selectedFoodData.description}",
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 15),
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}

class FoodQuantityModule extends StatelessWidget {
  FoodQuantityModule({Key? key}) : super(key: key);
  final screenController = Get.find<FoodDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Quantity",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.greenColor),
              ),
              child: Row(
                children: [

                  GestureDetector(
                    onTap: () => screenController.foodQtyDecrease(),
                    child: Icon(
                        Icons.remove_rounded,
                      color: screenController.qty.value == 1 ? AppColors.greyColor : AppColors.blackColor,
                    ).commonAllSidePadding(3),
                  ),

                  Obx(
                    () => Text("${screenController.qty.value}").commonSymmetricPadding(horizontal: 8),
                  ),
                  GestureDetector(
                      onTap: () => screenController.foodQtyIncrease(),
                      child: Icon(
                          Icons.add_rounded,
                          color: screenController.qty.value == 10 ? AppColors.greyColor : AppColors.blackColor
                      ).commonAllSidePadding(3)),

                ],
              ),
            ),
          ],
        ).commonOnlyPadding(bottom: 5),
        const Divider(thickness: 1),
      ],
    );
  }
}

class FoodTotalAmountModule extends StatelessWidget {
  FoodTotalAmountModule({Key? key}) : super(key: key);
  final screenController = Get.find<FoodDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Total Amount: ",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),

        Text(
          "\$ ${screenController.finalFoodAmount.value}",
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColors.greenColor,
          ),
        ),
      ],
    );
  }
}


