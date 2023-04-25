import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance/app_images.dart';
import '../../controller/restaurants_details_screen_controller.dart';


class RestaurantLogoAndNameModule extends StatelessWidget {
  RestaurantLogoAndNameModule({Key? key}) : super(key: key);
  final screenController = Get.find<RestaurantsDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              screenController.restaurantLogo,
              fit: BoxFit.cover,
              errorBuilder: (context, obj, st) {
                return Image.asset(
                  AppImages.AppLogo,
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                screenController.restaurantName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                screenController.restaurantDescription,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10),
              ),
              const SizedBox(height: 1),
              Text(
                screenController.restaurantAddress,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10),
              ),

            ],
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.heart),
        )
      ],
    );
  }
}


class RestaurantRatingModule extends StatelessWidget {
  RestaurantRatingModule({Key? key}) : super(key: key);
  final screenController = Get.find<RestaurantsDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.star_fill,
                    size: 13,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    screenController.ratingCount.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 3),
              Text(
                "${screenController.overallRating} Ratings",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12),
              ),


            ],
          ),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                CupertinoIcons.location_solid,
                size: 16,
                color: Colors.amber,
              ),
              SizedBox(height: 3),
              Text(
                "Location",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),

        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.stopwatch_fill,
                  size: 13,
                  color: Colors.amber,
                ),
                const SizedBox(width: 3),
                Text(
                  screenController.deliveryTime,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
            const SizedBox(height: 3),
            Text(
              "Delivery Time",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),


          ],
        ),
        ),
      ],
    );
  }
}
