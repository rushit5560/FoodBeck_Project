import 'package:flutter/material.dart';
import 'package:food_back/common_modules/common_appbar.dart';
import 'package:food_back/common_modules/custom_loader.dart';
import 'package:food_back/constance/app_images.dart';
import 'package:food_back/constance/color.dart';
import 'package:food_back/constance/message.dart';
import 'package:food_back/model/address_screen_model/user_address_model.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';

import '../../common_modules/custom_alert_dialog.dart';
import '../../controller/address_manage_screen_controller.dart';
import 'address_manage_screen_widgets.dart';

class AddressManageScreen extends StatelessWidget {
  AddressManageScreen({Key? key}) : super(key: key);
  final addressManageScreenController =
      Get.put(AddressManageScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleText: AppMessage.addressHeader,
        leadingShow: false,
        actionShow: false,
      ),
      body: Obx(
        () => addressManageScreenController.isLoading.value
            ? const CustomLoader()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    /// Address List Module

                    ListView.builder(
                      itemCount:
                          addressManageScreenController.userAddressList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        AddressData singleAddress =
                            addressManageScreenController.userAddressList[i];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                AppImages.addresses,
                                height: 80,
                                width: 80,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      singleAddress.addressType
                                          .capitalizeFirstLetter(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 1),
                                    Text(singleAddress.contactPersonName
                                        .capitalizeFirstLetter()),
                                    const SizedBox(height: 1),
                                    Text(
                                        "${singleAddress.houseNo} ${singleAddress.floor} ${singleAddress.address} ${singleAddress.landmark}"),
                                    const SizedBox(height: 1),
                                    Text(
                                        "Phone Number : ${singleAddress.contactPersonNumber}"),
                                    const SizedBox(height: 2),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text('Edit'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            CustomAlertDialog().showAlertDialog(
                                              context: context,
                                              textContent:
                                                  "Are you sure you want to delete this address ?",
                                              onCancelTap: () => Get.back(),
                                              onYesTap: () async =>
                                                  addressManageScreenController
                                                      .deleteUserAddressFunction(
                                                          addressId:
                                                              singleAddress.id
                                                                  .toString()),
                                            );
                                          },
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ).commonSymmetricPadding(vertical: 10);
                      },
                    ).commonSymmetricPadding(vertical: 10, horizontal: 10),

                    /// Add New Address Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [AddNewAddress(),],
                    ).commonSymmetricPadding(vertical: 10),
                  ],
                ),
              ),
      ),
    );
  }
}
