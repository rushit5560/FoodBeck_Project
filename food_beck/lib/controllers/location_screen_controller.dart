import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_beck/screens/index_screen/index_screen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../utils/user_preferences.dart';

class LocationScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxString address = ''.obs;
  double latitude = 0.0;
  double longitude = 0.0;
  UserPreference userPreference = UserPreference();
  RxBool getLocationPermission = false.obs;
  String locationZipCode = "";
  RxBool isUserLocationStatus = false.obs;

  void onLickButtonFunction() {
    log("isUserLocationStatus.value 111 ${isUserLocationStatus.value}");
    if (isUserLocationStatus.value == false) {
      handleLocationPermission();
    } else {
      getCurrentLocation();
    }
  }

  void getCurrentLocation() async {
    log("getCurrentLocation");
    isLoading(true);
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    latitude = position.latitude;
    longitude = position.longitude;
    // log('Latitude: $latitude, Longitude: $longitude');
    await getAddressFromlatLog(position);
  }

  Future<bool> handleLocationPermission() async {
    log("handleLocationPermission");
    isLoading(true);
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services'),
        ),
      );

      getLocationPermission = false.obs;
      return getLocationPermission.value;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      // Geolocator.openAppSettings();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        // Geolocator.openAppSettings();

        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')),
        );

        getLocationPermission = false.obs;

        return getLocationPermission.value;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();

      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.'),
        ),
      );

      Geolocator.openAppSettings();
      getLocationPermission = false.obs;
      return getLocationPermission.value;
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    await getAddressFromlatLog(position);

    if (permission == LocationPermission.always) {
      getLocationPermission.value = true;
      userPreference.setBoolValueInPrefs(
          key: UserPreference.isUserLocationKey, value: true);
      // userPreference.setBoolValueInPrefs(
      //     key: UserPreference.isMobileLocationGetKey, value: true);
    }
    if (permission == LocationPermission.whileInUse) {
      getLocationPermission.value = true;
      userPreference.setBoolValueInPrefs(
          key: UserPreference.isUserLocationKey, value: true);
      // userPreference.setBoolValueInPrefs(
      //     key: UserPreference.isMobileLocationGetKey, value: true);
    }
    isLoading(false);

    return true;
  }

  Future<void> getAddressFromlatLog(Position position) async {
    isLoading(true);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // log("Placemark $placemarks");
    Placemark place = placemarks[0];

    address.value =
        '${place.street},${place.name},${place.subLocality},${place.locality},${place.administrativeArea},${place.postalCode}';
    log("address.value ${address.value}");
    userPreference.setStringValueInPrefs(
        key: UserPreference.userAddressKey, value: address.toString());
    userPreference.setBoolValueInPrefs(
        key: UserPreference.isUserLocationKey, value: true);
    isLoading(false);
    Get.offAll(() => IndexScreen());
  }

  Future initMethod() async {
    isUserLocationStatus.value = await userPreference.getBoolFromPrefs(
        key: UserPreference.isUserLocationKey);
    log('isUserLocationStatus.value 33333 : ${isUserLocationStatus.value}');
  }
  @override
  void onInit() {

    initMethod();

    // initMethod();
    super.onInit();
  }
}
