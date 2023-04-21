import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_back/constance/app_images.dart';
import 'package:food_back/constance/color.dart';
import 'package:get/get.dart';

import '../../constance/api_url.dart';
import '../../controller/edit_profile_screen_controller.dart';

class ProfileImageModule extends StatelessWidget {
  ProfileImageModule({super.key});
  final editProfileScreenController = Get.find<EditProfileScreenController>();
  @override
  Widget build(BuildContext context) {
    log("editProfileScreenController.selectedProfileImage ${editProfileScreenController.selectedProfileImage}");
    return GestureDetector(
      onTap: () {
        editProfileScreenController.showImagePickerBottomSheet(
            context: context);
      },
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyColor),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(200),
              ),
              child: editProfileScreenController.selectedProfileImage != null
                  ? Container(
                      decoration: BoxDecoration(
                      // color: Colors.black,
                      shape: BoxShape.circle,
                      // border: Border.all(
                      //     color: AppColors.whiteColor, width: 3),
                      image: DecorationImage(
                        image: FileImage(
                          editProfileScreenController.selectedProfileImage!,
                        ),
                        fit: BoxFit.cover,
                      ),
                      // child: Image.file(
                      //     profileScreenController.selectedProfileImage!,
                      //     height: 75,
                      //     width: 75,
                      //     fit: BoxFit.cover,
                      //   ),
                    ))
                  : Container(
                      decoration: const BoxDecoration(
                        // color: Colors.black,
                        shape: BoxShape.circle,
                        // border: Border.all(
                        //     color: AppColors.whiteColor, width: 3),
                        image: DecorationImage(
                          image: AssetImage(
                            AppImages.AppLogo,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
          ),
          Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.whiteColor),
              child: Icon(Icons.edit))
        ],
      ),
    );
  }
}
