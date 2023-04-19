import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_back/constance/app_images.dart';
import 'package:food_back/constance/color.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:sizer/sizer.dart';
import '../../controller/recipes_screen_controller.dart';
import '../food_screen/food_screen.dart';

class SearchbarAndFooTypeModule extends StatelessWidget {
  final void Function(bool)? onPressed;

  SearchbarAndFooTypeModule({Key? key, this.onPressed}) : super(key: key);
  final recipesScreenController = Get.find<RecipesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Theme.of(context).dividerColor,
                  ),
                  child: TextFormField(
                    controller: recipesScreenController.searchbarController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none,
                      hintText: 'Find something...',
                    ),
                  ),
                ).commonOnlyPadding(right: 12),
              ),
              Container(
                //padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).primaryColor,
                ),
                child: IconButton(
                  onPressed: () {
                    log('message');
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ).commonOnlyPadding(left: 10, right: 10, bottom: 10),
        InkWell(
          onTap: () {
            Get.to(() =>  FoodScreen());
          },
          child: Container(
            height: 50,
            color: Theme.of(context).backgroundColor,
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 8, right: 12),
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.lightPinkColor,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            AppImages.imag1,
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            'Food',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.blackColor,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class BannerModule extends StatelessWidget {
  BannerModule({Key? key}) : super(key: key);
  final recipesScreenController = Get.find<RecipesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: recipesScreenController.list
              .map(
                (item) => Card(
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  elevation: 0,
                  child: InkWell(
                    onTap: () {
                      //Get.to(()=> DinnerView());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(
                            item,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.5,
            enlargeCenterPage: true,
          ),
        ),
        SizedBox(height: 1.h),
        MySeparator(color: Theme.of(context).primaryColor),
      ],
    ).commonOnlyPadding(top: 10);
  }
}

class TakeYourPickModule extends StatelessWidget {
  TakeYourPickModule({Key? key}) : super(key: key);
  final recipesScreenController = Get.find<RecipesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Take Your Pick",
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
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      //color: Theme.of(context).cardColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.0),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.asset(
                            AppImages.home2img1,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // const Expanded(child: SizedBox()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Fresh Salad Thaid',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '10 mins',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: AppColors.grey300Color,
                                  ),
                                ),
                                SizedBox(width: 3.w),
                                Text(
                                  '268 kcal',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: AppColors.grey300Color,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
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

class BreakfastModule extends StatelessWidget {
  BreakfastModule({Key? key}) : super(key: key);
  final recipesScreenController = Get.find<RecipesScreenController>();

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
  final recipesScreenController = Get.find<RecipesScreenController>();

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
  final recipesScreenController = Get.find<RecipesScreenController>();

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
  final recipesScreenController = Get.find<RecipesScreenController>();

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
}
