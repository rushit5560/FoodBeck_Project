import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_beck/constants/api_url.dart';
import 'package:food_beck/constants/color.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_images.dart';
import '../../controllers/cart_screen_controller.dart';
import '../../utils/style.dart';

class ListviewBuilderModule extends StatelessWidget {
  ListviewBuilderModule({Key? key}) : super(key: key);
  final cartScreenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    log("cartScreenController.getCartList.length ${cartScreenController.getCartList.length}");
    return ListView.builder(
        itemCount: cartScreenController.getCartList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: AppColors.greenColor.withOpacity(0.20),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("${ApiUrl.foodImagePathUrl}${cartScreenController.getCartList[index].foods.image}"),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartScreenController.getCartList[index].foods.name,
                      style: TextStyleConfig.textStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$ ${cartScreenController.getCartList[index].foods.price}",
                      style: TextStyleConfig.textStyle(
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    await cartScreenController.decrement(cartScreenController.getCartList[index], index);
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      color: AppColors.greenColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.remove,
                        color: AppColors.whiteColor2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                // Obx(
                //   () =>
                      Text(
                      cartScreenController.getCartList[index].quantity,
                    style: TextStyleConfig.textStyle(
                      fontSize: 14.sp,
                      textColor: AppColors.blackColor,
                    ),
                  ),
                // ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    cartScreenController.increment(cartScreenController.getCartList[index], index);
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                        color: AppColors.greenColor, shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: AppColors.whiteColor2,
                      ),
                    ),
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 10, vertical: 10),
          ).paddingOnly(top: 10);
        });
  }
}

class PriceTotalModule extends StatelessWidget {
  PriceTotalModule({Key? key}) : super(key: key);
  final cartScreenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greenColor,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Price Summary",
                style: TextStyleConfig.textStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(color: AppColors.greenColor),
          const SizedBox(height: 10),
          const Row(
            children: [
              Text("Order Total"),
              Spacer(),
              Text("₹2032"),
            ],
          ),
          const Row(
            children: [
              Text(
                "Item Total",
              ),
              Spacer(),
              Text("₹1020")
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "To Pay",
                style: TextStyleConfig.textStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                "₹5300",
                style: TextStyleConfig.textStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 10, vertical: 10),
    );
  }
}

class CouponCodeModule extends StatelessWidget {
  CouponCodeModule({Key? key}) : super(key: key);
  final cartScreenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      maintainState: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: AppColors.greenColor),
      ),
      collapsedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: AppColors.greenColor),
      ),
      title: Text(
        'Offers',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
      ),

      // trailing: Icon(Icons.arrow_forward_ios_rounded,
      //   size: 18.sp,
      // ),
      children: [
        ListView.builder(
          itemCount: cartScreenController.offersList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.greyColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Flat 99\$ Off',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                            ),
                            Text(
                              'Save 99\$ with this code',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 9.sp,
                                color: AppColors.greenColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.greenColor),
                        ),
                        child: Text(
                          'FB99',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11.sp,
                          ),
                        ).paddingSymmetric(horizontal: 3, vertical: 2),
                      ),
                    ],
                  ),
                  const Divider(height: 1, color: AppColors.greyColor),
                  GestureDetector(
                    onTap: () {
                      cartScreenController.appliedOffer.value =
                          !cartScreenController.appliedOffer.value;
                    },
                    child: Obx(
                      () => Container(
                        child: cartScreenController.appliedOffer.value
                            ? Text(
                                'APPLIED',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.greenColor,
                                  fontSize: 12.sp,
                                ),
                              ).paddingOnly(top: 5)
                            : Text(
                                'TAP TO APPLY',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 12.sp,
                                ),
                              ).paddingOnly(top: 5),
                      ),
                    ),
                  ),
                ],
              ).paddingAll(8),
            ).paddingSymmetric(vertical: 5, horizontal: 5);
          },
        ),
      ],
    ).paddingSymmetric(vertical: 8);
    /*return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Offers',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.greenColor),
          ),
          child: Container(),
        ),
      ],
    ).paddingSymmetric(vertical: 8);*/
  }
}

class SelectAddressModule extends StatelessWidget {
  SelectAddressModule({Key? key}) : super(key: key);
  final cartScreenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      maintainState: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: AppColors.greenColor),
      ),
      collapsedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: AppColors.greenColor),
      ),
      title: Text(
        'Select address',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
      ),
      children: [
        ListView.builder(
          itemCount: cartScreenController.offersList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {},
        ),
      ],
    );
  }
}
