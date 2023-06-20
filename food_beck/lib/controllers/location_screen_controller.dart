import 'dart:developer';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxString address = ''.obs;
  RxBool locationValue = false.obs;

  void getCurrentLocation() async {
    isLoading(true);

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    double latitude = position.latitude;
    double longitude = position.longitude;

    log('Latitude: $latitude, Longitude: $longitude');
    await getAddressFromlatLog(position);
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
    locationValue(true);

    isLoading(false);
    Get.back();
  }
}
