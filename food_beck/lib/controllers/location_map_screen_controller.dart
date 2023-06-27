import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../utils/user_preferences.dart';

class LocationMapScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxString address = ''.obs;
  double latitude = 0.0;
  double longitude = 0.0;
  UserPreference userPreference = UserPreference();
  String latitude1 = '';
  String longitude1 = '';
  RxBool getLocationPermission = false.obs;
  RxBool isUserLocationStatus = false.obs;

  Future<void> onLickButtonFunction() async {
    log("getLocationPermission.value ${getLocationPermission.value}");
    // ignore: unrelated_type_equality_checks
    if (isUserLocationStatus.value == false) {
      await handleLocationPermission();
    } else {
      getCurrentLocation();
    }
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
    }
    if (permission == LocationPermission.whileInUse) {
      getLocationPermission.value = true;
      userPreference.setBoolValueInPrefs(
          key: UserPreference.isUserLocationKey, value: true);
    }
    isLoading(false);

    return true;
  }

  Future<void> getAddressFromlatLog(Position position) async {
    isLoading(true);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    log("Placemark $placemarks");
    Placemark place = placemarks[0];
    address.value =
        '${place.street},${place.name},${place.subLocality},${place.locality},${place.administrativeArea},${place.postalCode}';
    log("address.value ${address.value}");
    userPreference.setStringValueInPrefs(
        key: UserPreference.userAddressKey, value: address.toString());
    // userPreference.getDoubleValueFromPrefs(
    //   key: UserPreference.latitudeKey,
    //   value: position.latitude,
    // );
    // userPreference.getDoubleValueFromPrefs(
    //   key: UserPreference.longitudeKey,
    //   value: position.longitude,
    // );
    log("position.latitude ${position.latitude}");
    log("position.longitude ${position.longitude}");
    latitude = position.latitude;
    longitude = position.longitude;
    userPreference.setBoolValueInPrefs(
        key: UserPreference.isUserLocationKey, value: true);
    isLoading(false);
  }

  void getCurrentLocation() async {
    log("getCurrentLocation");
    isLoading(true);
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    latitude = position.latitude;
    longitude = position.longitude;
    log('Latitude: $latitude, Longitude: $longitude');
    await getAddressFromlatLog(position);
  }

  Future<void> initMethod() async {
    isLoading(true);
    isUserLocationStatus.value = await userPreference.getBoolFromPrefs(
        key: UserPreference.isUserLoggedInKey);
    log('isUserLocationStatus.value : ${isUserLocationStatus.value}');
    latitude1 = await userPreference.getStringFromPrefs(
        key: UserPreference.latitudeKey);

    log('latitude1 :$latitude1');
    longitude1 = await userPreference.getStringFromPrefs(
        key: UserPreference.longitudeKey);

    log('longitude1 :$longitude1');

    await onLickButtonFunction();
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
}
