import 'package:flutter/material.dart';
import 'package:food_back/constance/app_images.dart';
import 'package:food_back/constance/extension.dart';
import 'package:food_back/constance/message.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constance/color.dart';
import '../../constance/font_family.dart';
import '../../constance/style.dart';
import '../../constance/theme.dart';
import '../../utils/widget/common_button.dart';
import '../index_screen/index_screen.dart';

class ChoiceTopicModule extends StatelessWidget {
  const ChoiceTopicModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      //physics: const BouncingScrollPhysics(),
      //  padding: const EdgeInsets.only(left: 14, right: 14),
      children: [
        Text(
          AppMessage.chooseTopicsText1,
          textAlign: TextAlign.center,
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayBold,
            textColor: AppColors.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          AppMessage.chooseTopicsText2,
          textAlign: TextAlign.center,
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayRegular,
            textColor: AppColors.greyColor,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topics("#59c2e9", AppImages.fruits, "Fruits"),
            topics("#f5f6f8", AppImages.meat, "Meat"),
            topics("#9f9093", AppImages.healthy, "Healthy"),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topics("#fafafc", AppImages.snack, "Snack"),
            topics("#ded586", AppImages.vegetable, "Vegetable"),
            topics("#dbe6fa", AppImages.fish, "Fish"),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topics("#85c0d6", AppImages.drink, "Drink"),
            topics("#264057", AppImages.nuts, "Nuts"),
            topics("#fdb26a", AppImages.medicne, "Medicine"),
          ],
        ),
        SizedBox(height: 5.h),
        CustomButton(
          height: 50,
          onPressed: () {
            Get.to(() =>  IndexScreen());
          },
          text: AppMessage.done,
        ),
      ],
    );
  }

  Widget topics(String color, String image, String name) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: HexColor(
              color,
            ),
          ),
          child: Image.asset(
            image,
            height: 80,
            width: 80,
          ).commonAllSidePadding(10),
        ),
        SizedBox(height: 2.h),
        Text(name,
            textAlign: TextAlign.center,
            style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplaySemibold,
              textColor: AppColors.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
        ),
      ],
    );
  }
}
