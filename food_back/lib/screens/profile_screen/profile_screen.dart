import 'package:flutter/material.dart';
import 'package:food_back/constance/extension.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constance/color.dart';
import '../../constance/style.dart';
import '../../controller/profile_screen_controller.dart';

class ProfileScreen extends StatelessWidget {
  final Function(bool)? onPressed;
   ProfileScreen({Key? key, this.onPressed}) : super(key: key);
  final profileScreenController = Get.put(ProfileScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SafeArea(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            childAspectRatio: 1.70,
          ),
          itemCount: profileScreenController.selectList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => profileScreenController.optionProfileClickFunction(index),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), //color of shadow
                      spreadRadius: 3,
                    )
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      height: 50,
                      profileScreenController.selectList[index].image,
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      // maxLines: 1,
                      textAlign: TextAlign.center,
                      profileScreenController.selectList[index].name,
                      style: TextStyleConfig.textStyle(
                        textColor: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ).commonAllSidePadding(5),
            );
          },
        ).commonAllSidePadding(15),
      ),
    );
  }
}
