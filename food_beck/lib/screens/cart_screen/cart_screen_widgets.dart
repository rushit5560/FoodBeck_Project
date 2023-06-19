import 'package:flutter/material.dart';
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
    return Expanded(
      child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                color: AppColors.lightGreenColor2,
              ),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.AppLogo),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    children: [
                      Text(
                        "Hot dog",
                        style: TextStyleConfig.textStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$ 150.00",
                        style: TextStyleConfig.textStyle(fontSize: 11.sp),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      cartScreenController.decrement();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          color: AppColors.greenColor, shape: BoxShape.circle),
                      child: const Center(
                        child: Icon(
                          Icons.remove,
                          color: AppColors.whiteColor2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Obx(
                    () => Text(
                      cartScreenController.counter.toString(),
                      style: TextStyleConfig.textStyle(
                        fontSize: 14.sp,
                        textColor: AppColors.blackColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      cartScreenController.increment();
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
            ).paddingOnly(top: 5);
          }),
    );
  }
}
