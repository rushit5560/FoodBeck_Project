import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_images.dart';
import '../../constants/color.dart';
import '../../controllers/edit_profile_screen_controller.dart';

class ProfileImageModule extends StatelessWidget {
  ProfileImageModule({super.key});
  final editProfileScreenController = Get.find<EditProfileScreenController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          editProfileScreenController.showImagePickerBottomSheet(
              context: context);
        },
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            editProfileScreenController.userProfilePhoto != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(80.0),
                    child: Image.file(
                      editProfileScreenController.userProfilePhoto!,
                      height: 120,
                      width: 120,
                      fit: BoxFit.fill,
                      // color: AppColors.grey200Color,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          AppImages.AppLogo,
                          height: 120,
                          width: 120,
                        );
                      },
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(80.0),
                    child: Image.network(
                      editProfileScreenController.userProfileImage,
                      height: 120,
                      width: 120,
                      fit: BoxFit.fill,
                      // color: AppColors.grey200Color,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          AppImages.AppLogo,
                          height: 120,
                          width: 120,
                        );
                      },
                    ),
                  ),
            GestureDetector(
              onTap: () {
                editProfileScreenController.showImagePickerBottomSheet(
                    context: context);
              },
              child: Container(
                height: 25,
                width: 25,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.greenColor,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ],
        )
        //  Stack(
        //   alignment: Alignment.bottomRight,
        //   children: [
        //     Container(
        //       height: 100,
        //       width: 100,
        //       decoration: BoxDecoration(
        //         border: Border.all(color: AppColors.greyColor),
        //         shape: BoxShape.circle,
        //       ),
        //       child: ClipRRect(
        //         borderRadius: const BorderRadius.all(
        //           Radius.circular(200),
        //         ),
        //         child: editProfileScreenController.userProfilePhoto != null
        //             ? Container(
        //                 decoration: BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 image: DecorationImage(
        //                   image: FileImage(
        //                     editProfileScreenController.userProfilePhoto!,
        //                   ),
        //                   fit: BoxFit.cover,
        //                 ),
        //               ))
        //             : Container(
        //                 decoration: const BoxDecoration(
        //                   shape: BoxShape.circle,
        //                 ),
        //                 child: ClipRRect(
        //                   child: Image.network(
        //                     editProfileScreenController.profileData == null
        //                         ? ""
        //                         : editProfileScreenController.profileData!.image,
        //                     fit: BoxFit.fill,
        //                     errorBuilder: (ctx, obj, st) {
        //                       return Container(
        //                         color: AppColors.greyColor.withOpacity(0.35),
        //                         child: Center(
        //                           child: Text(
        //                             "No Image",
        //                             style: TextStyle(
        //                               color: AppColors.blackColor,
        //                               fontSize: 10.sp,
        //                             ),
        //                           ),
        //                         ),
        //                       );
        //                     },
        //                   ),
        //                 ),
        //               ),
        //       ),
        //     ),
        //     Container(
        //       height: 30,
        //       width: 30,
        //       decoration: const BoxDecoration(
        //           shape: BoxShape.circle, color: AppColors.whiteColor),
        //       child: const Icon(Icons.edit),
        //     )
        //   ],
        // ),
        );
  }
}
