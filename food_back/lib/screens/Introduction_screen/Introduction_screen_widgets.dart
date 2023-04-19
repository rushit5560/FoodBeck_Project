import 'package:flutter/material.dart';
import 'package:food_back/constance/app_images.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:food_back/constance/font_family.dart';
import 'package:food_back/constance/message.dart';
import 'package:get/get.dart';
import 'package:food_back/constance/app_images.dart' as constance;
import 'package:sizer/sizer.dart';
import '../../constance/color.dart';
import '../../controller/introduction_screen_controller.dart';
import '../../utils/style.dart';
import '../../utils/widget/common_button.dart';
import '../choice _topic_screen/choice _topic_screen.dart';
import 'Introduction_screen.dart';

class IntroductionModule extends StatefulWidget {
   const IntroductionModule({Key? key}) : super(key: key);
  @override
  State<IntroductionModule> createState() => _IntroductionModuleState();
}

class _IntroductionModuleState extends State<IntroductionModule> {
  int selectedPage = 0;
  final introductionScreenController = Get.find<IntroductionScreenController>();
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  color: selectedPage == 0
                      ? Theme
                      .of(context)
                      .primaryColor
                      : constance.secondary.withOpacity(0.3),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  color: selectedPage == 1
                      ? Theme
                      .of(context)
                      .primaryColor
                      : constance.secondary.withOpacity(0.3),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  color: selectedPage == 2
                      ? Theme
                      .of(context)
                      .primaryColor
                      : constance.secondary.withOpacity(0.3),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Expanded(
          flex: 6,
          child: PageView(
            controller: _pageController,
            onPageChanged: (number) {
              setState(() {
                selectedPage = number;
              });
            },
            children: [
              firstIntroduction(),
              firstIntroduction(),
              firstIntroduction(),
            ],
          ),
        )
      ],
    );
  }

  Widget firstIntroduction() {
    return Column(
      children: [
        Image.asset(
          selectedPage == 0
              ? AppImages.intro1
              : selectedPage == 1
              ? AppImages.intro2
              : AppImages.intro3,
          height: 200,
        ),
         SizedBox(height: 1.h),
        Text(
          selectedPage == 0
              ? AppMessage.onlineShopping
              : selectedPage == 1
              ? AppMessage.detailedRecipes
              : AppMessage.shipAtYourHome,
            textAlign: TextAlign.center,
            style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayBold,
            textColor: AppColors.blackColor,
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
         SizedBox(height: 1.h),
        Text(
          selectedPage == 0
              ? AppMessage.introductionText1
              : selectedPage == 1
              ? AppMessage.introductionText2
              : AppMessage.introductionText3,
            textAlign: TextAlign.center,
            style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayRegular,
            textColor: AppColors.greyColor,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ).commonOnlyPadding(right: 14, left: 14),
        const Expanded(child: SizedBox()),
        InkWell(
          onTap: () {
            Get.to(()=> IntroductionScreen());
          },
          child: CustomButton(
              height: 50,
              onPressed: () {
                if (selectedPage == 0) {
                  _pageController.jumpToPage(1);
                } else if (selectedPage == 1) {
                  _pageController.jumpToPage(2);
                } else {
                  Get.to(()=> ChoiceTopicScreen());
                }
              },
              text: AppMessage.shoppingNow,
          ).commonOnlyPadding(right: 20, left: 20),
        ),
      ],
    );
  }
}
