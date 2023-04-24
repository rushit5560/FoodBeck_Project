import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_back/constance/color.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../controller/edit_profile_screen_controller.dart';

class ProfileImageModule extends StatelessWidget {
  ProfileImageModule({super.key});
  final editProfileScreenController = Get.find<EditProfileScreenController>();
  @override
  Widget build(BuildContext context) {
    log("editProfileScreenController.selectedProfileImage 222 ${editProfileScreenController.selectedProfileImage}");
    log("editProfileScreenController.profileImage 222 ${editProfileScreenController.profileImage}");
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
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(
                          editProfileScreenController.selectedProfileImage!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ))
                  : Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        child: Image.network(
                          editProfileScreenController.profileData == null
                              ? ""
                              : editProfileScreenController.profileData!.image,
                          fit: BoxFit.fill,
                          errorBuilder: (ctx, obj, st) {
                            return Container(
                              color: AppColors.greyColor.withOpacity(0.35),
                              child: Center(
                                child: Text(
                                  "No Image",
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                            );
                          },
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
            child: const Icon(Icons.edit),
          )
        ],
      ),
    );
  }
}
