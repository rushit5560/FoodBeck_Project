import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../common_modules/discount_label_module.dart';
import '../../constants/api_url.dart';
import '../../constants/app_images.dart';
import '../../constants/color.dart';
import '../../controllers/foods_screen_controller.dart';
import '../../models/common_models/food_data_model.dart';


class FoodListShowModule extends StatelessWidget {
  List<FoodData> foodsList;
  FoodListShowModule({Key? key, required this.foodsList}) : super(key: key);
  final screenController = Get.find<FoodsScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: foodsList.length,
      itemBuilder: (context, i) {

        FoodData singleFood = foodsList[i];
        String imgUrl = ApiUrl.foodImagePathUrl + singleFood.image;
        String discountType = singleFood.discountType == "amount" ? "\$" : "%";

        return Stack(
          children: [
            Row(
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
                        label: "${singleFood.discount} $discountType",
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
                        singleFood.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        singleFood.description,
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
                            itemPadding: const EdgeInsets.symmetric(
                                horizontal: 1.0),
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
                          )
                        ],
                      ),
                      const SizedBox(height: 1),
                      Row(
                        children: [
                          Text(
                            "\$${singleFood.price}",
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingAll(5),
            Positioned(
              bottom: 5,
              right: 5,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(singleFood.isFav == true
                        ? Icons.favorite_rounded
                        : Icons.favorite_outline_rounded,
                      color: singleFood.isFav == true
                          ? AppColors.redColor
                          : AppColors.blackColor,),
                  ),

                  const SizedBox(height: 8),


                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.add_rounded),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(indent: 100, endIndent: 15);
      },
    );
  }
}
