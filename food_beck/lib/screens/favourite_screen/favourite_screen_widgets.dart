import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../constants/api_url.dart';
import '../../constants/app_images.dart';
import '../../constants/color.dart';
import '../../controllers/favorites_screen_controller.dart';

class FavouriteRestaurantsModule extends StatelessWidget {
  FavouriteRestaurantsModule({Key? key}) : super(key: key);
  final screenController = Get.find<FavoritesScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.favouriteRestaurantList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        // String imgUrl = ApiUrl.restaurantImagePathUrl + restaurantDetails.coverPhoto;
        String imgUrl = "";
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.lightGreenColor.withOpacity(0.2)
          ),
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
                    const Text(
                      "restaurantDetails.name",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      "restaurantDetails.description",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 10),
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
                onTap: () {
                  Fluttertoast.showToast(msg: "Clicked On Favourite!");
                },
                child: const Icon(CupertinoIcons.heart),
              ),
            ],
          ).paddingSymmetric(horizontal: 10, vertical: 8),
        ).paddingAll(8);
      },
    );
  }
}


class FavouriteFoodsModule extends StatelessWidget {
  FavouriteFoodsModule({Key? key}) : super(key: key);
  final screenController = Get.find<FavoritesScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.favouriteFoodList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        String imgUrl = "";

        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightGreenColor.withOpacity(0.2)
          ),
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
                    const Text(
                      "foodDetails.name",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      "foodDetails.description",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 10),
                    ),
                    const SizedBox(height: 1),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 2.5,
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
                          "(2.5)",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: "Clicked On Favourite!");
                },
                child: const Icon(CupertinoIcons.heart),
              ),
            ],
          ).paddingSymmetric(horizontal: 10, vertical: 8),
        ).paddingAll(8);
      },
    );
  }
}
