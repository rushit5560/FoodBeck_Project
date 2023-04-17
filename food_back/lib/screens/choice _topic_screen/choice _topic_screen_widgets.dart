
import 'package:flutter/material.dart';
import 'package:food_back/constance/app_images.dart';
import 'package:food_back/constance/extension.dart';
import 'package:food_back/constance/message.dart';
import 'package:food_back/screens/Home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constance/color.dart';
import '../../constance/font_family.dart';
import '../../constance/style.dart';
import '../../constance/theme.dart';
import '../../utils/widget/common_button.dart';

class ChoiceTopicModule extends StatelessWidget {
  const ChoiceTopicModule({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 14, right: 14),
      children: [
        SizedBox(height: 12.h),
        Text(
          AppMessage.chooseTopicsText1,
          textAlign: TextAlign.center,
            style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplayBold,
              textColor: AppColors.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            )
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
            )
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topic("#59c2e9", AppImages.fruits, "Fruits"),
            topic("#f5f6f8", AppImages.meat, "Meat"),
            topic("#9f9093", AppImages.healthy, "Healthy"),
          ],
        ),
       SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topic("#fafafc", AppImages.snack, "Snack"),
            topic("#ded586", AppImages.vegetable, "Vegetable"),
            topic("#dbe6fa", AppImages.fish, "Fish"),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topic("#85c0d6", AppImages.drink, "Drink"),
            topic("#264057", AppImages.nuts, "Nuts"),
            topic("#fdb26a", AppImages.medicne, "Medicine"),
          ],
        ),
        SizedBox(height: 2.h),
        CustomButton(
          height: 50,
          onPressed: () {
           Get.to(const HomeScreen());
          },
          text: AppMessage.done,
        ),
      ],
    );
  }

  Widget topic(String color, String image, String name) {
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
        Text(
          name,
          textAlign: TextAlign.center,
            style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplaySemibold,
              textColor: AppColors.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            )
        ),
      ],
    );
  }
}
