import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_back/constance/api_url.dart';
import 'package:food_back/constance/app_images.dart';
import 'package:food_back/constance/color.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:sizer/sizer.dart';
import '../../controller/recipes_screen_controller.dart';
import '../../utils/style.dart';

class SearchbarModule extends StatelessWidget {
  final void Function(bool)? onPressed;

  SearchbarModule({Key? key, this.onPressed}) : super(key: key);
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
                    //log('message');
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ).commonOnlyPadding(left: 10, right: 10),
        // InkWell(
        //   onTap: () {
        //     Get.to(() => FoodScreen());
        //   },
        //
        // ),
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
        CarouselSlider.builder(
          itemCount: recipesScreenController.bannerList.length,
          itemBuilder: (context, i, realIndex) {
            String imgUrl =
                "${ApiUrl.bannerImagePathUrl}/${recipesScreenController.bannerList[i].image}";
            log("imgUrl11 $imgUrl");
            return Card(
              margin: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side:
                    BorderSide(color: Theme.of(context).primaryColor, width: 2),
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
              recipesScreenController.isLoading(true);
              recipesScreenController.currentIndex.value = index;
              recipesScreenController.isLoading(false);
            },
          ),
        ).commonSymmetricPadding(vertical: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: recipesScreenController.bannerList.map((url) {
            int index = recipesScreenController.bannerList.indexOf(url);
            return Container(
              width:
                  recipesScreenController.currentIndex.value == index ? 16 : 11,
              height:
                  recipesScreenController.currentIndex.value == index ? 16 : 11,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: recipesScreenController.currentIndex.value == index
                        ? 2
                        : 0,
                    color: recipesScreenController.currentIndex.value == index
                        ? AppColors.whiteColor
                        : Colors.transparent),
                color: recipesScreenController.currentIndex.value == index
                    ? AppColors.amberColor
                    : AppColors.greyColor,
              ),
            );
          }).toList(),
        ),
        //SizedBox(height: 1.h),
        // MySeparator(color: Theme.of(context).primaryColor),
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
        ).commonSymmetricPadding(horizontal: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recipesScreenController.takeYourPickProductList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var value =
                  recipesScreenController.takeYourPickProductList[index];
              String imgUrl =
                  "${ApiUrl.allProductImagePathUrl}/${recipesScreenController.takeYourPickProductList[index].image}";
              log("imgUrl $imgUrl");
              return Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                //height: 100.h,
                width: 250,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor2,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  // boxShadow: [BoxShadow(
                  //   blurRadius: 2,
                  //   offset: Offset(0, -1),
                  // )]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          height: 15.h,
                          decoration: BoxDecoration(
                            //color: AppColors.whiteColor2,
                            // boxShadow: [
                            //   BoxShadow(
                            //       blurRadius: 3,
                            //     offset: Offset(0, 1),
                            //   ),
                            // ],
                            image: DecorationImage(
                              image: NetworkImage(imgUrl),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GlassContainer(
                            height: 30,
                            width: 30,
                            blur: 4,
                            color: AppColors.whiteColor2,
                            shadowStrength: 10,
                            opacity: 0.2,
                            border:
                                const Border.fromBorderSide(BorderSide.none),
                            borderRadius: BorderRadius.circular(10),
                            child: const Icon(
                              Icons.favorite_border_outlined,
                              color: AppColors.grey300Color,
                              size: 18,
                            ),
                          ),
                        ).commonSymmetricPadding(vertical: 5, horizontal: 10)
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      value.name,
                      //textAlign: TextAlign.right,
                      style: TextStyleConfig.textStyle(
                        textColor: AppColors.blackColor,
                        fontSize: 12.sp,
                        // fontFamily: FontFamilyText.sFProDisplaySemibold,
                        // fontWeight: FontWeight.normal,
                      ),
                    ).commonOnlyPadding(left: 10),
                    Text(
                      value.description,
                      //textAlign: TextAlign.right,
                      style: TextStyleConfig.textStyle(
                        textColor: AppColors.blackColor,
                        fontSize: 12.sp,
                        // fontFamily: FontFamilyText.sFProDisplaySemibold,
                        // fontWeight: FontWeight.normal,
                      ),
                    ).commonOnlyPadding(left: 10),
                    Row(
                      //mainAxisAlignment:MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          value.price,
                          //textAlign: TextAlign.right,
                          style: TextStyleConfig.textStyle(
                            textColor: AppColors.blackColor,
                            fontSize: 12.sp,
                            // fontFamily: FontFamilyText.sFProDisplaySemibold,
                            // fontWeight: FontWeight.normal,
                          ),
                        ),
                        const Icon(
                          Icons.star,
                          color: AppColors.amberColor,
                        ),
                        const Icon(
                          Icons.star,
                          color: AppColors.amberColor,
                        ),
                        const Icon(
                          Icons.star,
                          color: AppColors.amberColor,
                        ),
                        const Icon(
                          Icons.star,
                          color: AppColors.amberColor,
                        ),
                        const Icon(
                          Icons.star,
                          color: AppColors.amberColor,
                        ),
                        Text(
                          value.rating,
                          //textAlign: TextAlign.right,
                          style: TextStyleConfig.textStyle(
                            textColor: AppColors.blackColor,
                            fontSize: 12.sp,
                            // fontFamily: FontFamilyText.sFProDisplaySemibold,
                            // fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ).commonOnlyPadding(left: 10),
                  ],
                ),
              );
            },
          ),
        ).commonSymmetricPadding(vertical: 10),
        MySeparator(color: Theme.of(context).primaryColor),
      ],
    );
  }
}



class CategoriesModule extends StatelessWidget {
  const CategoriesModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 100,
       // color: Theme.of(context).backgroundColor,
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 100,
             // padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 12),
              //margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:AppColors.lightPinkColor,
                    ),
                    child: Image.asset(
                      AppImages.fev5,
                      fit: BoxFit.fill,
                      height: 60,
                    ),
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
            );
          },
        ),
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
