import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_beck/screens/location_screen/location_screen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/api_url.dart';
import '../../models/sign_in_model/sign_in_model.dart';
import '../../screens/index_screen/index_screen.dart';
import '../../utils/user_preferences.dart';
import 'package:dio/dio.dart' as dio;

class SignInScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxString address = ''.obs;
  double latitude = 0.0;
  double longitude = 0.0;
  RxBool getLocationPermission = false.obs;
  RxBool hidePass = true.obs;
  GlobalKey<FormState> signInformKey = GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  UserPreference userPreference = UserPreference();
  final dioRequest = dio.Dio();
  RxBool isUserLocationStatus = false.obs;

  /// Login Function
  Future<void> userLoginFunction() async {
    isLoading(true);
    String url = ApiUrl.loginApi;
    log('userLoginFunction Api Url :$url');

    try {
      Map<String, dynamic> bodyData = {
        "email": loginEmailController.text.trim().toLowerCase(),
        "password": loginPasswordController.text.trim(),
      };
      final response = await dioRequest.post(
        url,
        data: bodyData,
      );
      log('userLoginFunction response :${response.data}');
      SignInModel signInModel = SignInModel.fromJson(response.data);
      isSuccessStatus.value = signInModel.success;
      if (isSuccessStatus.value) {
        userPreference.setBoolValueInPrefs(
            key: UserPreference.isUserLoggedInKey, value: true);
        userPreference.setStringValueInPrefs(
            key: UserPreference.userIdKey,
            value: signInModel.data.id.toString());
        userPreference.setStringValueInPrefs(
          key: UserPreference.userTokenKey,
          value: signInModel.token,
        );
        userPreference.setStringValueInPrefs(
          key: UserPreference.userEmailKey,
          value: signInModel.data.email,
        );
        userPreference.setStringValueInPrefs(
          key: UserPreference.userNameKey,
          value: signInModel.data.name,
        );
        userPreference.setStringValueInPrefs(
          key: UserPreference.userPhoneKey,
          value: signInModel.data.phoneno,
        );
        userPreference.setStringValueInPrefs(
          key: UserPreference.userImageKey,
          value: signInModel.data.image,
        );
        userPreference.setStringValueInPrefs(
          key: UserPreference.userZoneIdKey,
          value: signInModel.data.zoneId.toString(),
        );
        // if (isUserLocationStatus.value == false) {
        //   Get.to(() => LocationScreen());
        // } else {
          Get.offAll(() => IndexScreen());
        // }
        log("signInModel.token : ${signInModel.token}");
        loginEmailController.clear();
        loginPasswordController.clear();
      } else {
        log('userLoginFunction Else');
        Fluttertoast.showToast(msg: signInModel.error);
        log("signInModel.error ${signInModel.error}");
      }
    } catch (e) {
      log('userLoginFunction Error :$e');
      rethrow;
    }
    isLoading(false);
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
      // Geolocator.openAppSettings();
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

  Future initMethod() async {
    isUserLocationStatus.value = await userPreference.getBoolFromPrefs(
        key: UserPreference.isUserLocationKey);
    log('isUserLocationStatus.value 33333 : ${isUserLocationStatus.value}');
    if(isUserLocationStatus.value == false){
      handleLocationPermission();
    }
    else{
      getCurrentLocation();
    }
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
/*@override
  void onInit() {
    loginEmailController.clear();
    loginPasswordController.clear();
    super.onInit();
  }*/
}
