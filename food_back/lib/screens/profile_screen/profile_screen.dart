import 'package:flutter/material.dart';
import 'package:food_back/common_modules/custom_loader.dart';
import 'package:food_back/constance/app_images.dart';
import 'package:food_back/constance/message.dart';
import 'package:food_back/screens/cms_page_screen/cms_page_screen.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';
import '../../constance/color.dart';
import '../../controller/profile_screen_controller.dart';
import '../address_manage_screen/list_address_screen/address_list_screen.dart';
import 'profile_screen_widgets.dart';

class ProfileScreen extends StatelessWidget {
  final Function(bool)? onPressed;

  ProfileScreen({Key? key, this.onPressed}) : super(key: key);
  final profileScreenController = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppMessage.profileHeader,
          style: const TextStyle(color: AppColors.blackColor),
        ),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => profileScreenController.isLoading.value
                  ? const CustomLoader()
                  : ProfileDetailsModule(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                EditProfileButtonModule(),
              ],
            ),

            // Account Information Header
            HeaderModule(
              headerTitle: AppMessage.accountInfoLabel,
            ).commonSymmetricPadding(vertical: 5),

            // Manage Address
            SettingListTileModule(
              onTap: () => Get.to(() => AddressListScreen()),
              leadingImage: AppImages.addresses,
              title: AppMessage.manageAddressesLabel,
            ).commonSymmetricPadding(vertical: 5),

            // Your Orders
            SettingListTileModule(
              onTap: () {},
              leadingImage: AppImages.orders,
              title: AppMessage.yourOrdersLabel,
            ).commonSymmetricPadding(vertical: 5),

            // Favourite Items
            SettingListTileModule(
              onTap: () {},
              leadingImage: AppImages.favourite,
              title: AppMessage.favouriteItemsLabel,
            ).commonSymmetricPadding(vertical: 5),

            // Notification
            SettingListTileModule(
              onTap: () {},
              leadingImage: AppImages.notification,
              title: AppMessage.notificationLabel,
            ).commonSymmetricPadding(vertical: 5),

            // Other Header
            HeaderModule(
              headerTitle: AppMessage.othersLabel,
            ).commonSymmetricPadding(vertical: 5),

            // T&C
            SettingListTileModule(
              onTap: () {
                Get.to(
                  () => CMSPageScreen(),
                  arguments: "4",
                );
              },
              leadingImage: AppImages.contract,
              title: AppMessage.termsAndConditionLabel,
            ).commonSymmetricPadding(vertical: 5),

            // Privacy Policy
            SettingListTileModule(
              onTap: () {
                Get.to(
                  () => CMSPageScreen(),
                  arguments: "3",
                );
              },
              leadingImage: AppImages.contract,
              title: AppMessage.privacyPolicyLabel,
            ).commonSymmetricPadding(vertical: 5),

            // About us
            SettingListTileModule(
              onTap: () {
                Get.to(
                  () => CMSPageScreen(),
                  arguments: "6",
                );
              },
              leadingImage: AppImages.about,
              title: AppMessage.aboutUsLabel,
            ).commonSymmetricPadding(vertical: 5),

            // Refund Policy
            SettingListTileModule(
              onTap: () {
                Get.to(
                  () => CMSPageScreen(),
                  arguments: "7",
                );
              },
              leadingImage: AppImages.contract,
              title: AppMessage.refundPolicyLabel,
            ).commonSymmetricPadding(vertical: 5),

            // Shipping Policy
            SettingListTileModule(
              onTap: () {
                Get.to(
                  () => CMSPageScreen(),
                  arguments: "8",
                );
              },
              leadingImage: AppImages.contract,
              title: AppMessage.shippingPolicyLabel,
            ).commonSymmetricPadding(vertical: 5),

            // Cancellation Policy
            SettingListTileModule(
              onTap: () {
                Get.to(
                  () => CMSPageScreen(),
                  arguments: "9",
                );
              },
              leadingImage: AppImages.contract,
              title: AppMessage.cancellationPolicyLabel,
            ).commonSymmetricPadding(vertical: 5),

            LogOutHeaderModule(headerTitle: AppMessage.logOut)
          ],
        ),
      ),

      /*body: SafeArea(
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
      ),*/
    );
  }
}
