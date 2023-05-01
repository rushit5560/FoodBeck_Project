import 'package:flutter/material.dart';
import 'package:food_back/constance/color.dart';
import 'package:food_back/constance/message.dart';
import 'package:food_back/screens/address_manage_screen/add_address_screen/add_address_screen.dart';
import 'package:get/get.dart';

import '../../constance/enums.dart';
import '../../controller/address_manage_screen_controller.dart';

class AddNewAddress extends StatelessWidget {
  AddNewAddress({Key? key}) : super(key: key);
  final screenController = Get.find<AddressManageScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => AddAddressScreen(),
          arguments: [AddressOption.add, ""],
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greenColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(
            AppMessage.addNewAddressHeader,
            textScaleFactor: 1.1,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
