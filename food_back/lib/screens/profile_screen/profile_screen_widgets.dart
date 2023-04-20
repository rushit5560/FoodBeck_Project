import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_back/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constance/app_images.dart';
import '../../constance/color.dart';
import '../../controller/profile_screen_controller.dart';

/// User Profile Details Show Module
class ProfileDetailsModule extends StatelessWidget {
  ProfileDetailsModule({Key? key}) : super(key: key);
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        // height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.greenColor),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                // flex: 65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      profileScreenController.userName.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      // textScaleFactor: 1.35,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.greenColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      profileScreenController.userEmail.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.greenColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      profileScreenController.userPhone.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.greenColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  height: 78,
                  width: 78,
                  child: Image.network(
                    profileScreenController.userImage.value,
                    errorBuilder: (context, obj, st) {
                      return Image.asset(
                        AppImages.AppLogo,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Edit Profile Button
class EditProfileButtonModule extends StatelessWidget {
  EditProfileButtonModule({Key? key}) : super(key: key);
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => EditProfileScreen(),
            // arguments: profileScreenController.userId,
          );
          // log("profileScreenController.userId ${profileScreenController.userId}");
        },
        // onTap: () => Get.to(()=> EditProfileScreen())!.then((value) async {
        //   await accountScreenController.getUserAccount();
        // }),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.greenColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Text(
              'Edit Profile',
              textScaleFactor: 1.1,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
