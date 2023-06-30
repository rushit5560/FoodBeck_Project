import 'package:flutter/material.dart';
import 'package:food_beck/utils/extensions.dart';
import 'package:get/get.dart';
import '../../../common_modules/common_appbar.dart';
import '../../../common_modules/custom_alert_dialog.dart';
import '../../../common_modules/custom_loader.dart';
import '../../../constants/app_images.dart';
import '../../../constants/color.dart';
import '../../../constants/enums.dart';
import '../../../constants/message.dart';
import '../../../controllers/address_list_screen_controller.dart';
import '../../../models/address_screen_model/user_address_model.dart';
import '../../../utils/style.dart';
import '../add_address_screen/address_manage_screen.dart';
import 'address_list_screen_widgets.dart';

class AddressListScreen extends StatelessWidget {
  AddressListScreen({Key? key}) : super(key: key);
  final addressManageScreenController = Get.put(AddressListScreenController());

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
                                          onPressed: () {
                                            Get.to(
                                              () => AddressManageScreen(),
                                              arguments: [
                                                AddressOption.edit,
                                                singleAddress.id.toString()
                                              ],
                                            );
                                          },
                                          child: Text('Edit',
                                            style: TextStyleConfig.textStyle(
                                              textColor: AppColors.greenColor,
                                            ),
                                          ),
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
                                                              singleAddress.id
                                                                  .toString(),
                                                           i),
                                            );
                                          },
                                          child: Text(
                                            'Delete',
                                            style: TextStyleConfig.textStyle(
                                              textColor: AppColors.redColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ).paddingSymmetric(vertical: 10);
                      },
                    ).paddingSymmetric(vertical: 10, horizontal: 10),

                    /// Add New Address Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AddNewAddressModule(),
                      ],
                    ).paddingSymmetric(vertical: 10),
                  ],
                ),
              ),
      ),
    );
  }
}
