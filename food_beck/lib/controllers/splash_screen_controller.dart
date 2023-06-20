import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/index_screen/index_screen.dart';
import '../screens/onboarding_screen/onboarding_screen.dart';
import '../utils/user_preferences.dart';

class SplashScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isUserLoggedInStatus = false.obs;
  UserPreference userPreference = UserPreference();
  RxBool getLocationPermission = false.obs;
  String locationZipCode = "";
  RxString latitude = ''.obs;
  RxString longitude = ''.obs;
  RxString address = ''.obs;
  String cityName = '';
  String stateName = '';

  startTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool onBoardingValue = prefs.getBool('onBoarding') ?? false;

    Timer(
      const Duration(milliseconds: 1500),
      () {
        log("isUserLoggedInStatus.value 11 ${isUserLoggedInStatus.value}");
        log("onBoardingValue onBoardingValue 11 : $onBoardingValue");
        if (onBoardingValue == false) {
          Get.offAll(
            () => OnboardingScreen(),
            transition: Transition.native,
          );
          log("onBoardingValue $onBoardingValue");
        } else if (isUserLoggedInStatus.value == true) {
          Get.offAll(
            () => IndexScreen(),
            transition: Transition.native,
          );
          log("isUserLoggedInStatus.value 22 ${isUserLoggedInStatus.value}");
        }

        // else if (isUserLoggedInStatus.value == false) {
        //   Get.offAll(
        //     () => SignInScreen(),
        //     transition: Transition.native,
        //   );
        //   log("isUserLoggedInStatus.value ${isUserLoggedInStatus.value}");
        // }
        // if (isUserLoggedInStatus.value) {
        //   log("login");
        //   Get.to(() => IndexScreen());
        // } else {
        //   Get.to(() => SignInScreen());
        // }
      },
    );
    await handleLocationPermission();
  }

  Future<bool> handleLocationPermission() async {
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
      Geolocator.openAppSettings();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        Geolocator.openAppSettings();

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
    /*streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      latitude.value = 'latitude: ${position.latitude}';
      longitude.value = 'longitude: ${position.longitude}';

      log("latitude.value ${latitude.value}");
      log("longitude.value ${longitude.value}");
      getAddressFromlatLog(position);
    });*/
    if (permission == LocationPermission.always) {
      getLocationPermission.value = true;
    }
    if (permission == LocationPermission.whileInUse) {
      getLocationPermission.value = true;
    }

    return true;
  }

  Future<void> getAddressFromlatLog(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    log("Placemark $placemarks");
    Placemark place = placemarks[0];
    address.value =
        '${place.street}, ${place.subLocality}, ${place.locality},${place.administrativeArea}, ${place.postalCode}, ${place.country}';
    log("address.value ${address.value}");
    locationZipCode = place.postalCode.toString();
    stateName = place.administrativeArea.toString();
    cityName = place.locality.toString();
    // await getCityStateDetailsByPinFunction(locationZipCode);
    // await userPrefsData.getLocationZipCode(locationZipCode);
  }

  Future<void> initMethod() async {
    isLoading(true);
    isUserLoggedInStatus.value = await userPreference.getBoolFromPrefs(
        key: UserPreference.isUserLoggedInKey);
    log('isUserLoggedInStatus.value : ${isUserLoggedInStatus.value}');
    await startTimer();
    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
}
