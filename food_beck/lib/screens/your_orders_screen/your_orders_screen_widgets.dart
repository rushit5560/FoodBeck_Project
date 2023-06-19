import 'package:flutter/material.dart';
import 'package:food_beck/constants/app_images.dart';
import 'package:food_beck/constants/color.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/your_orders_screen_controller.dart';
import '../../utils/widget/common_button.dart';

class OngoingOrderList extends StatelessWidget {
  OngoingOrderList({Key? key}) : super(key: key);
  final screenController = Get.find<YourOrdersScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.onGoingOrdersList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.lightGreenColor.withOpacity(0.25),
          ),
          child: Row(
            children: [
              // Image Module
              Expanded(
                flex: 30,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.whiteColor2,
                    // shape: BoxShape.rectangle
                  ),
                  child: Image.asset(
                    AppImages.search10,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Description Module
              Expanded(
                flex: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Restaurant Name',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),

                    Text(
                      '16 March 2023, 7:00PM',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8.sp,
                      ),
                    ),

                    Text(
                      'Order Id : 123456789',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8.sp,
                      ),
                    ),

                    Text(
                      'Payment Method : COD',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8.sp,
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 5),
              ),

              // Status Module
              Expanded(
                flex: 20,
                child: Column(
                  children: [
                    Text(
                      "\$150",
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.greenColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Preparing',
                        style: TextStyle(
                            color: AppColors.whiteColor2,
                            fontSize: 8.sp
                        ),
                      ).paddingSymmetric(horizontal: 4, vertical: 4),
                    ),
                  ],
                ),
              ),


            ],
          ).paddingAll(5),
        ).paddingAll(8);
      },
    );
  }
}

class CompleteOrderList extends StatelessWidget {
  CompleteOrderList({Key? key}) : super(key: key);
  final screenController = Get.find<YourOrdersScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.completeOrderList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.lightGreenColor.withOpacity(0.25),
          ),
          child: Row(
            children: [
              // Image Module
              Expanded(
                flex: 30,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.whiteColor2,
                    // shape: BoxShape.rectangle
                  ),
                  child: Image.asset(
                    AppImages.search10,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Description Module
              Expanded(
                flex: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Restaurant Name',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),

                    Text(
                      '16 March 2023, 7:00PM',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8.sp,
                      ),
                    ),

                    Text(
                      'Order Id : 123456789',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8.sp,
                      ),
                    ),

                    Text(
                      'Payment Method : COD',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8.sp,
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 5),
              ),

              // Status Module
              Expanded(
                flex: 20,
                child: Column(
                  children: [
                    Text(
                      "\$150",
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.greenColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Delivered',
                        style: TextStyle(
                          color: AppColors.whiteColor2,
                          fontSize: 8.sp
                        ),
                      ).paddingSymmetric(horizontal: 4, vertical: 4),
                    ),
                  ],
                ),
              ),


            ],
          ).paddingAll(5),
        ).paddingAll(8);
      },
    );
  }
}
