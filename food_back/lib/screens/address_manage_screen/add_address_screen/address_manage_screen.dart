import 'package:flutter/material.dart';
import 'package:food_back/common_modules/common_appbar.dart';
import 'package:food_back/common_modules/custom_loader.dart';
import 'package:food_back/common_modules/custom_submit_button.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constance/color.dart';
import '../../../constance/message.dart';
import '../../../controller/address_manage_screen_controller.dart';
import 'address_manage_screen_widgets.dart';

class AddressManageScreen extends StatelessWidget {
  AddressManageScreen({Key? key}) : super(key: key);
  final addAddressScreenController = Get.put(AddressManageScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: customAppBar(
        titleText: "Add Address",
        leadingShow: false,
        actionShow: false,
      ),
      body: Obx(
        () => addAddressScreenController.isLoading.value
            ? const CustomLoader()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: addAddressScreenController.addAddressFormKey,
                  child: Column(
                    children: [
                      AddressManageTextFormFieldModule(),
                      SizedBox(height: 5.h),
                      CustomSubmitButtonModule(
                        labelText: AppMessage.submit,
                        onPress: () async {
                          await addAddressScreenController
                              .buttonOnpressButtonFunction();
                        },
                      ),
                    ],
                  ).commonOnlyPadding(left: 25, right: 25, top: 40),
                ),
              ),
      ),
    );
  }
}