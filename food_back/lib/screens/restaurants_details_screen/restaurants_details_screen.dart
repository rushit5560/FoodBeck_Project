import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_back/screens/home_screen/home_screen.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constance/api_url.dart';
import '../../constance/color.dart';
import '../../controller/restaurants_details_screen_controller.dart';

class RestaurantsDetailsScreen extends StatelessWidget {
  RestaurantsDetailsScreen({super.key});

  final restaurantsDetailsScreenController =
      Get.put(RestaurantsDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    log("images ${restaurantsDetailsScreenController.image}");
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: AppColors.greenColor,
            elevation: 0,
            floating: true,
            snap: true,
            pinned: true,
            expandedHeight: 250,
            leading: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.greenColor),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ).commonOnlyPadding(left: 20),
            actions: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.greenColor),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ).commonOnlyPadding(right: 20),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                restaurantsDetailsScreenController.image,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: AppColors.blackColor,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://thumbs.dreamstime.com/b/wooden-table-food-top-view-cafe-102532611.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("cb"),
                    Text("dgdfjghk"),
                    Text("dgdfjghk"),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                )
              ],
            ).commonSymmetricPadding(horizontal: 10, vertical: 10)
          ],
        ),
      ),
    );
  }
}
