import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../common_modules/discount_lable_module.dart';
import '../../constants/app_images.dart';
import '../../constants/color.dart';
import '../../controllers/food_details_screen_controller.dart';
import '../../models/food_details_model/food_details_model.dart';
import '../restaurants_details_screen/restaurants_details_screen.dart';


class FoodImageModule extends StatelessWidget {
  FoodImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<FoodDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    String discountType = screenController.selectedFoodData!.discountType == "amount" ? "\$" : "%";

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
            label: "${screenController.selectedFoodData!.discount} $discountType OFF",
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
              color: screenController.selectedFoodData!.veg == 1 ? AppColors.greenColor
              : AppColors.redColor,
            ),
            child: Text(
              screenController.selectedFoodData!.veg == 1 ? "Veg" : "Non-Veg",
              maxLines: 1,
              // textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ).paddingSymmetric(horizontal: 10, vertical: 5),
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
          screenController.selectedFoodData!.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3),

        GestureDetector(
          onTap: () {
            Get.to(
                  ()=> RestaurantsDetailsScreen(),
              arguments: screenController.selectedFoodData!.id.toString(),
            );
          },
          child: const Text(
            "Restaurant Name",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 15, color: AppColors.greenColor),
          ),
        ),
        const SizedBox(height: 3),

        Row(
          children: [
            RatingBar.builder(
              initialRating: double.parse(screenController.selectedFoodData!.rating),
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
              "(${screenController.selectedFoodData!.rating})",
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
        const SizedBox(height: 3),

        Text(
          "\$${screenController.selectedFoodData!.price}",
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
          screenController.selectedFoodData!.description,
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
                    ).paddingAll(3),
                  ),

                  Obx(
                    () => Text("${screenController.qty.value}").paddingSymmetric(horizontal: 8),
                  ),
                  GestureDetector(
                      onTap: () => screenController.foodQtyIncrease(),
                      child: Icon(
                          Icons.add_rounded,
                          color: screenController.qty.value == 10 ? AppColors.greyColor : AppColors.blackColor
                      ).paddingAll(3)),

                ],
              ),
            ),
          ],
        ).paddingOnly(bottom: 5),
        const Divider(thickness: 1),
      ],
    );
  }
}


class FoodVariantModule extends StatelessWidget {
  FoodVariantModule({Key? key}) : super(key: key);
  final screenController = Get.find<FoodDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: screenController.selectedFoodData!.variations.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {

        Variation variantData = screenController.selectedFoodData!.variations[i];
        log('variantData : ${variantData.selectedVariantValue}');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              variantData.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: variantData.values.length,
              itemBuilder: (context, j) {
                VariantValue variantValue = variantData.values[j];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Radio<String>(
                            onChanged: (value) {
                              variantData.selectedVariantValue = value!;
                              screenController.loadUI();
                            },
                            value: variantValue.optionPrice,
                            groupValue: variantData.selectedVariantValue,
                          ),
                          Text(
                              variantValue.label
                          ),
                        ],
                      ),
                    ),

                    Text(
                        "+ \$ ${variantValue.optionPrice}",
                      style: const TextStyle(color: AppColors.greyColor),
                    ),
                  ],
                );
              },
            ),

          ],
        );
      },
    ).paddingSymmetric(horizontal: 10);
  }
}

class StoreButtonAndCartButtonModule extends StatelessWidget {
  StoreButtonAndCartButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<FoodDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FoodTotalAmountModule().paddingSymmetric(horizontal: 10),
        Row(
          children: [

            GestureDetector(
              onTap: () {
                Get.to(
                      ()=> RestaurantsDetailsScreen(),
                arguments: screenController.selectedFoodData!.id.toString(),
                );
              },
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.greenColor, width: 2),
                ),
                child: const Icon(
                  Icons.store_mall_directory_rounded,
                  color: AppColors.greenColor,
                ).paddingAll(10),
              ).paddingOnly(right: 20),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Fluttertoast.cancel();
                  Fluttertoast.showToast(msg: "Going to cart!");
                },
                child: Container(
                  width: Get.size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.greenColor,
                  ),
                  child: const Center(
                    child: Text(
                      'Order Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 10),
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
      mainAxisAlignment: MainAxisAlignment.center,
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




