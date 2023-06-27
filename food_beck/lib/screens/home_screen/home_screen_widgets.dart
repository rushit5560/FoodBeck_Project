import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/discount_label_module.dart';
import '../../constants/api_url.dart';
import '../../constants/app_images.dart';
import '../../constants/color.dart';
import '../../constants/enums.dart';
import '../../controllers/home_screen_controller.dart';
import '../../models/common_models/food_data_model.dart';
import '../../models/common_models/restaurant_data_model.dart';
import '../../models/home_screen_model/category_model.dart';
import '../../models/home_screen_model/cuisine_model.dart';
import '../foods_screen/foods_screen.dart';
import '../restaurants_details_screen/restaurants_details_screen.dart';
import '../restaurants_screen/restaurants_screen.dart';


class BannerModule extends StatelessWidget {
  BannerModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: screenController.bannerList.length,
          itemBuilder: (context, i, realIndex) {
            String imgUrl =
                "${ApiUrl.bannerImagePathUrl}/${screenController.bannerList[i].image}";
            return Card(
              margin: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side:
                    const BorderSide(color: AppColors.greenColor, width: 2),
              ),
              elevation: 0,
              child: InkWell(
                onTap: () {
                  //Get.to(()=> DinnerView());
                },
                child: Container(
                  // height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(
                        imgUrl,
                      ),
                      onError: (exception, stackTrace) =>
                          Image.asset(AppImages.dinner1),
                      fit: BoxFit.fill,
                    ),
                  ),
                  // child: CachedNetworkImage(
                  //   height: 100,
                  //   imageUrl: imgUrl,
                  //   fit: BoxFit.fill,
                  //   errorWidget: (context, url, error) {
                  //     return const CustomLoader();
                  //   },
                  // ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.5,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              screenController.isLoading(true);
              screenController.currentIndex.value = index;
              screenController.isLoading(false);
            },
          ),
        ).paddingSymmetric(vertical: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: screenController.bannerList.map((url) {
            int index = screenController.bannerList.indexOf(url);
            return Container(
              width: screenController.currentIndex.value == index ? 16 : 10,
              height: screenController.currentIndex.value == index ? 16 : 10,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: screenController.currentIndex.value == index ? 2 : 0,
                    color: screenController.currentIndex.value == index
                        ? AppColors.whiteColor
                        : Colors.transparent),
                color: screenController.currentIndex.value == index
                    ? AppColors.amberColor
                    : AppColors.greyColor,
              ),
            );
          }).toList(),
        ),
        //SizedBox(height: 1.h),
        // MySeparator(color: Theme.of(context).primaryColor),
      ],
    ).paddingOnly(top: 10);
  }
}

class CategoriesModule extends StatelessWidget {
  CategoriesModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: Center(
        child: ListView.builder(
          itemCount: screenController.categoryList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            CategoryData singleCategory = screenController.categoryList[index];
            String imgUrl = ApiUrl.categoryImagePathUrl + singleCategory.image;

            return GestureDetector(
              onTap: () {
                Get.to(
                  () => RestaurantsScreen(),
                  arguments: [
                    singleCategory.id.toString(),
                    singleCategory.name,
                    RestaurantComingFrom.category,
                  ],
                );
              },
              child: Column(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, obj, st) {
                          return Image.asset(
                            AppImages.AppLogo,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    singleCategory.name,
                  ),
                ],
              ).paddingAll(8),
            );
          },
        ),
      ),
    );
  }
}

class PopularRestaurantsModule extends StatelessWidget {
  PopularRestaurantsModule({super.key});
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Popular Restaurants",
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                      () => RestaurantsScreen(),
                  arguments: [
                    "",
                    "Popular Restaurants",
                    RestaurantComingFrom.popularRestaurants,
                  ],
                );
              },
              child: Text(
                "View All",
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.greenColor,
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 5),
        SizedBox(
          height: 188,
          child: ListView.builder(
            itemCount: screenController.allPopularRestaurantList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              // String imgUrl = "https://thumbs.dreamstime.com/b/wooden-table-food-top-view-cafe-102532611.jpg";
              RestaurantData singleRestaurant = screenController.allPopularRestaurantList[i];
              String imgUrl = "${ApiUrl.restaurantImagePathUrl}/${singleRestaurant.logo}";
              return GestureDetector(
                onTap: () {
                  Get.to(() => RestaurantsDetailsScreen(),
                      arguments: singleRestaurant.id.toString());
                },
                child: Container(
                  width: Get.width * 0.60,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: AppColors.greyColor,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          // Image Container
                          Expanded(
                            child: Container(
                              // height: 105,
                              width: Get.width,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
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
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  singleRestaurant.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  singleRestaurant.description,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 10),
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
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ).paddingAll(8),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            Fluttertoast.cancel();
                            Fluttertoast.showToast(
                                msg: "Clicked On favourite!");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: const Icon(
                              Icons.favorite_border_outlined,
                              size: 18,
                            ).paddingAll(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ).paddingSymmetric(horizontal: 10),
              );
            },
          ),
        ),
      ],
    );
  }
}

class TrendingFoodsModule extends StatelessWidget {
  TrendingFoodsModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Trending Food Offers",
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "View All",
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.greenColor,
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 5),
        SizedBox(
          height: 172,
          child: ListView.builder(
            itemCount: screenController.trendingFoodList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              FoodData singleFood = screenController.trendingFoodList[i];
              String imgUrl = ApiUrl.foodImagePathUrl + singleFood.image;

              String discountType =
                  singleFood.discountType == "amount" ? "\$" : "%";

              // log("TrendingFood imgUrl $imgUrl");
              return GestureDetector(
                onTap: () async {
                  // await screenController.getFoodDetailsFunction(singleFood.id.toString());
                  // Get.to(
                  //   () => FoodDetailsScreen(),
                  //   arguments: [singleFood.id.toString()],
                  // );
                },
                child: Container(
                  width: Get.width * 0.30,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: AppColors.greyColor,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: Get.width,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
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
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                const SizedBox(height: 1),
                                Text(
                                  singleFood.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 10),
                                ),
                                const SizedBox(height: 1),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "\$${singleFood.price}",
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          CupertinoIcons.star_fill,
                                          color: Colors.orange,
                                          size: 11,
                                        ),
                                        const SizedBox(width: 1),
                                        Text(
                                          // "4.5",
                                          singleFood.rating,
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ).paddingAll(8),
                          ),
                        ],
                      ),

                      Positioned(
                        top: 10,
                        right: 0,
                        child: DiscountLabelModule(
                          label: "${singleFood.discount} $discountType",
                          labelShowRightSide: true,
                          fontSize: 10,
                        ),
                      ),

                      // Positioned(
                      //   right: 0,
                      //   top: 8,
                      //   child: Container(
                      //     decoration: const BoxDecoration(
                      //       color: AppColors.greenColor,
                      //       borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(10),
                      //         bottomLeft: Radius.circular(10),
                      //       ),
                      //     ),
                      //     child: Text(
                      //       "${singleFood.discount} %",
                      //       style:
                      //           const TextStyle(color: Colors.white, fontSize: 8),
                      //     ).commonSymmetricPadding(horizontal: 5, vertical: 2),
                      //   ),
                      // ),
                    ],
                  ),
                ).paddingSymmetric(horizontal: 10),
              );
            },
          ),
        ),
      ],
    );
  }
}

class PopularFoodNearByModule extends StatelessWidget {
  PopularFoodNearByModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Popular Foods Nearby",
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(()=> FoodsScreen(),
                  arguments: [
                    "Popular Foods Nearby",
                    FoodsComingFrom.bestReviewedFood,
                  ],
                );
              },
              child: Text(
                "View All",
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.greenColor,
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 5),
        SizedBox(
          height: 115,
          child: ListView.builder(
            itemCount: screenController.popularFoodNearbyList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              FoodData singleFood =
                  screenController.popularFoodNearbyList[i];
              String imgUrl = ApiUrl.foodImagePathUrl + singleFood.image;
              // String imgUrl =
              //     "https://thumbs.dreamstime.com/b/wooden-table-food-top-view-cafe-102532611.jpg";

              String discountType =
                  singleFood.discountType == "amount" ? "\$" : "%";
              return Container(
                width: Get.size.width * 0.65,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: AppColors.greyColor,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Stack(
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
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.add_rounded),
                      ),
                    ),
                  ],
                ),
              ).paddingSymmetric(horizontal: 10);
            },
          ),
        ),
      ],
    );
  }
}

class NewRestaurantModule extends StatelessWidget {
  NewRestaurantModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "New Restaurants",
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                      () => RestaurantsScreen(),
                  arguments: [
                    "",
                    "New Restaurants",
                    RestaurantComingFrom.newRestaurants,
                  ],
                );
              },
              child: Text(
                "View All",
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.greenColor,
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 5),
        SizedBox(
          height: 185,
          child: ListView.builder(
            itemCount: screenController.newRestaurantList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              // String imgUrl =
              //     "https://thumbs.dreamstime.com/b/wooden-table-food-top-view-cafe-102532611.jpg";
              String imgUrl =
                  "${ApiUrl.restaurantImagePathUrl}/${screenController.allPopularRestaurantList[i].logo}";
              RestaurantData singleRestaurant =
                  screenController.newRestaurantList[i];
              return Container(
                width: Get.width * 0.60,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: AppColors.greyColor,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Container(
                            // height: 105,
                            width: Get.width,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
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
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                singleRestaurant.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                singleRestaurant.description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 10),
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
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ).paddingAll(8),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.cancel();
                          Fluttertoast.showToast(msg: "Clicked On favourite!");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.favorite_border_outlined,
                            size: 18,
                          ).paddingAll(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ).paddingSymmetric(horizontal: 10);
            },
          ),
        ),
      ],
    );
  }
}

class BestReviewedFoodModule extends StatelessWidget {
  BestReviewedFoodModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Best Reviewed Food",
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(()=> FoodsScreen(),
                  arguments: [
                    "Best Reviewed Food",
                    FoodsComingFrom.bestReviewedFood,
                  ],
                );
              },
              child: Text(
                "View All",
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.greenColor,
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 5),
        SizedBox(
          height: 115,
          child: ListView.builder(
            itemCount: screenController.bestReviewedFoodList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              FoodData singleFood =
                  screenController.bestReviewedFoodList[i];
              String imgUrl = ApiUrl.foodImagePathUrl + singleFood.image;
              // String imgUrl =
              //     "https://thumbs.dreamstime.com/b/wooden-table-food-top-view-cafe-102532611.jpg";

              String discountType =
                  singleFood.discountType == "amount" ? "\$" : "%";

              return Container(
                width: Get.size.width * 0.65,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: AppColors.greyColor,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Stack(
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
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.add_rounded),
                      ),
                    ),
                  ],
                ),
              ).paddingSymmetric(horizontal: 10);
            },
          ),
        ),
      ],
    );
  }
}

class AllRestaurantsModule extends StatelessWidget {
  AllRestaurantsModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /*Expanded(
              child: */
            Text(
              "All Restaurants",
              style: TextStyle(
                fontSize: 11.sp,
                color: AppColors.blackColor,
              ),
            ),
            // ),
            /*Text(
              "View All",
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.greenColor,
              ),
            ),*/
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 5),
        ListView.separated(
          itemCount: screenController.allRestaurantList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(indent: 100, endIndent: 15);
          },
          itemBuilder: (context, i) {
            RestaurantData restaurantDetails =
                screenController.allRestaurantList[i];
            String imgUrl =
                ApiUrl.restaurantImagePathUrl + restaurantDetails.coverPhoto;
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
                  onTap: () {
                    Fluttertoast.showToast(msg: "Clicked On Favourite!");
                  },
                  child: const Icon(CupertinoIcons.heart),
                ),
              ],
            ).paddingSymmetric(horizontal: 10, vertical: 8);
          },
        ),
      ],
    );
  }
}

class CuisineListModule extends StatelessWidget {
  CuisineListModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Cuisines",
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            Text(
              "View All",
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.greenColor,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 5),
        GridView.builder(
          itemCount: screenController.cuisinesList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, i) {
            CuisineDetails cuisineDetails = screenController.cuisinesList[i];
            return cuisineGridTile(cuisineDetails);
          },
        ),
      ],
    ).paddingSymmetric(vertical: 5);
  }

  Widget cuisineGridTile(CuisineDetails cuisineDetails) {
    String imgUrl = ApiUrl.cuisineImageUrl + cuisineDetails.image;
    // log('Cuisine imgUrl : $imgUrl');
    return GestureDetector(
      onTap: () {
        // Get.to(
        //   () => RestaurantsScreen(),
        //   arguments: [
        //     cuisineDetails.id.toString(),
        //     cuisineDetails.name,
        //     RestaurantComingFrom.cuisines,
        //   ],
        // );
      },
      child: Column(
        children: [
          Expanded(
            flex: 75,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                width: Get.width,
                imgUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, obj, st) {
                  return Image.asset(
                    AppImages.AppLogo,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ).paddingSymmetric(horizontal: 5),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text(
                cuisineDetails.name,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12),
              ),
            ).paddingSymmetric(horizontal: 2),
          ),
        ],
      ),
    );
  }
}



/*class BreakfastModule extends StatelessWidget {
  BreakfastModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Breakfast",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackColor,
              ),
            ),
            Text(
              "View All",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ).commonSymmetricPadding(horizontal: 10, vertical: 10),
        Text(
          "Breakfast is widely acknowledged to be the most important meal of the day.",
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.grey300Color,
          ),
        ).commonSymmetricPadding(horizontal: 10, vertical: 10),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 7),
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).cardColor,
                            image: const DecorationImage(
                              image: AssetImage(
                                AppImages.home2imag4,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: GlassContainer(
                          height: 30,
                          width: 30,
                          blur: 4,
                          shadowStrength: 10,
                          opacity: 0.2,
                          border: const Border.fromBorderSide(BorderSide.none),
                          borderRadius: BorderRadius.circular(10),
                          child: const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ).commonOnlyPadding(left: 15, top: 10)
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        MySeparator(color: Theme.of(context).primaryColor),
      ],
    );
  }
}

class SnackModule extends StatelessWidget {
  SnackModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Snack",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackColor,
              ),
            ),
            Text(
              "View All",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ).commonSymmetricPadding(horizontal: 10, vertical: 10),
        Text(
          "Snacking allows you not to fell hungry during the day and prevents a decrease inblood glucode.",
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.grey300Color,
          ),
        ).commonSymmetricPadding(horizontal: 10, vertical: 10),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 7),
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).cardColor,
                            image: const DecorationImage(
                              image: AssetImage(
                                AppImages.home3image1,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: GlassContainer(
                          height: 30,
                          width: 30,
                          blur: 4,
                          shadowStrength: 10,
                          opacity: 0.2,
                          border: const Border.fromBorderSide(BorderSide.none),
                          borderRadius: BorderRadius.circular(10),
                          child: const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ).commonOnlyPadding(left: 15, top: 10)
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        MySeparator(color: Theme.of(context).primaryColor),
      ],
    );
  }
}

class LunchModule extends StatelessWidget {
  LunchModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Lunch",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackColor,
              ),
            ),
            Text(
              "View All",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ).commonSymmetricPadding(horizontal: 10, vertical: 10),
        Text(
          "Lunch usually refers to the most significant meal of the day.",
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.grey300Color,
          ),
        ).commonSymmetricPadding(horizontal: 10, vertical: 10),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 7),
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).cardColor,
                            image: const DecorationImage(
                              image: AssetImage(
                                AppImages.lunch5,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: GlassContainer(
                          height: 30,
                          width: 30,
                          blur: 4,
                          shadowStrength: 10,
                          opacity: 0.2,
                          border: const Border.fromBorderSide(BorderSide.none),
                          borderRadius: BorderRadius.circular(10),
                          child: const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ).commonOnlyPadding(left: 15, top: 10)
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        MySeparator(color: Theme.of(context).primaryColor),
      ],
    );
  }
}

class DinnerModule extends StatelessWidget {
  DinnerModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Dinner",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackColor,
              ),
            ),
            Text(
              "View All",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ).commonSymmetricPadding(horizontal: 10, vertical: 10),
        Text(
          "Dinner is your last meal 2-3 hours before bedtime.",
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.grey300Color,
          ),
        ).commonSymmetricPadding(horizontal: 10, vertical: 10),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 7),
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).cardColor,
                            image: const DecorationImage(
                              image: AssetImage(
                                AppImages.dinner4,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: GlassContainer(
                          height: 30,
                          width: 30,
                          blur: 4,
                          shadowStrength: 10,
                          opacity: 0.2,
                          border: const Border.fromBorderSide(BorderSide.none),
                          borderRadius: BorderRadius.circular(10),
                          child: const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ).commonOnlyPadding(left: 15, top: 10)
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        MySeparator(color: Theme.of(context).primaryColor),
      ],
    );
  }
}

class MySeparator extends StatelessWidget {
  final double? height;
  final Color? color;

  const MySeparator({super.key, this.height = 1.3, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}*/
