import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/color.dart';
import '../../../constants/enums.dart';
import '../../../constants/message.dart';
import '../../../controllers/address_list_screen_controller.dart';
import '../add_address_screen/address_manage_screen.dart';


class AddNewAddressModule extends StatelessWidget {
  AddNewAddressModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddressListScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => AddressManageScreen(),
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
