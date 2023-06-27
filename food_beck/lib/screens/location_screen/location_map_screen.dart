import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_beck/common_modules/custom_loader.dart';
import 'package:food_beck/screens/index_screen/index_screen.dart';
import 'package:get/get.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import '../../constants/color.dart';
import '../../controllers/location_map_screen_controller.dart';
import '../../utils/user_preferences.dart';

class MapLocationScreen extends StatelessWidget {
  MapLocationScreen({Key? key}) : super(key: key);
  final locationMapScreenController = Get.put(LocationMapScreenController());

  @override
  Widget build(BuildContext context) {
    log("locationMapScreenController.latitude ${locationMapScreenController.longitude1}");
    log("locationMapScreenController.longitude ${locationMapScreenController.longitude1}");
    log("locationMapScreenController.address.value ${locationMapScreenController.address.value}");
    return Scaffold(
      body:
          // Obx(
          //   () => locationMapScreenController.isLoading.value
          //       ? const CustomLoader()
          //       :

          OpenStreetMapSearchAndPick(
        buttonColor: AppColors.greenColor,
        buttonText: "Set Location",
        center: LatLong(12.74349654761492,
            0.351313167233327),
        onPicked: (pickedData) {
          locationMapScreenController.isLoading(true);
          locationMapScreenController.address.value = pickedData.address;

          log("locationMapScreenController.address.value ${locationMapScreenController.address.value}");
          locationMapScreenController.userPreference.setStringValueInPrefs(
              key: UserPreference.userAddressKey,
              value: locationMapScreenController.address.value);
          locationMapScreenController.isLoading(false);

          log(pickedData.latLong.latitude.toString());
          log(pickedData.latLong.longitude.toString());
          log("pickedData.address : ${pickedData.address}");
          Get.to(() => IndexScreen());
        },
      ),

    );
  }
}
