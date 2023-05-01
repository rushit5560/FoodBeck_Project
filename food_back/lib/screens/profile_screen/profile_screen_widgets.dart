import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_back/constance/message.dart';
import 'package:food_back/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/custom_alert_dialog.dart';
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
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(200),
                  ),
                  child: SizedBox(
                    height: 78,
                    width: 78,
                    child: Image.network(
                      profileScreenController.userImage.value,
                      fit: BoxFit.cover,
                      errorBuilder: (context, obj, st) {
                        return Image.asset(
                          AppImages.AppLogo,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
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
            // arguments: [
            //   profileScreenController.userId,
            //   profileScreenController.userName,
            //   profileScreenController.userEmail,
            //   profileScreenController.userPhone,
            //   profileScreenController.userImage
            // ],
          )!
              .then((value) async {
            await profileScreenController.getMyProfileDataValueFromPrefs();
          });
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Text(
              AppMessage.editProfileLabel,
              textScaleFactor: 1.1,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderModule extends StatelessWidget {
  final String headerTitle;
  const HeaderModule({Key? key, required this.headerTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: AppColors.greenColor, thickness: 2),
        Text(
          headerTitle,
          style: const TextStyle(fontSize: 22, color: AppColors.greenColor),
        ).commonSymmetricPadding(horizontal: 10),
        const Divider(color: AppColors.greenColor, thickness: 2),
      ],
    );
  }
}

class LogOutHeaderModule extends StatelessWidget {
  final String headerTitle;
  LogOutHeaderModule({Key? key, required this.headerTitle}) : super(key: key);
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: AppColors.greenColor, thickness: 2),
        GestureDetector(
          onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomLogoutAlertDialog(
                  text: "Logout",
                  content: "Are you sure you want logout ?",
                  yesButtonText: "Yes",
                  onYesPressed: () async =>
                      await profileScreenController.logOutButtonFunction(),
                  noButtonText: "No",
                  onNoPressed: () => Get.back(),
                );
              }),
          child: Row(
            children: [
              const Icon(
                Icons.logout_rounded,
                color: AppColors.greenColor,
              ),
              SizedBox(width: 2.w),
              Text(
                headerTitle,
                style:
                    const TextStyle(fontSize: 22, color: AppColors.greenColor),
              ),
            ],
          ).commonSymmetricPadding(horizontal: 10, vertical: 10),
        ),
        const Divider(color: AppColors.greenColor, thickness: 2),
      ],
    );
  }
}

class SettingListTileModule extends StatelessWidget {
  final String title;
  final Function() onTap;
  final String leadingImage;

  const SettingListTileModule({
    Key? key,
    required this.title,
    required this.onTap,
    required this.leadingImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(),
          color: AppColors.whiteColor,
        ),
        child: Row(
          children: [
            Image.asset(
              leadingImage,
              width: 25,
              height: 25,
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 15),
              ).commonSymmetricPadding(horizontal: 8),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
          ],
        ).commonSymmetricPadding(horizontal: 10, vertical: 10),
        /*child: ListTile(
          onTap: onTap,
          leading: leadingWidget,
          title: Text(
            title,
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),*/
      ).commonSymmetricPadding(horizontal: 10),
    );
  }
}
