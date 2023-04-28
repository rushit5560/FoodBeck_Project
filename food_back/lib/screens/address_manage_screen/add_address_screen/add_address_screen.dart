import 'package:flutter/material.dart';
import 'package:food_back/common_modules/common_appbar.dart';
import 'package:food_back/common_modules/custom_loader.dart';
import 'package:get/get.dart';
import '../../../controller/add_address_screen_controller.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({Key? key}) : super(key: key);
  final addAddressScreenController = Get.put(AddAddressScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Column(
                  children: [],
                ),
              ),
      ),
    );
  }
}
