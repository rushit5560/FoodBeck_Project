import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../constance/api_url.dart';
import '../constance/enums.dart';
import '../model/address_screen_model/add_address_model.dart';
import '../model/sign_up_model/zone_model.dart';
import '../utils/user_preferences.dart';
import 'package:http/http.dart' as http;

import 'address_manage_screen_controller.dart';

class AddAddressScreenController extends GetxController {
  AddressOption addressOption = Get.arguments[0];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  String userId = "";
  RxBool successStatus = false.obs;
  ZoneData? selectedZoneValue;

  UserPreference userPreference = UserPreference();
  GlobalKey<FormState> addAddressFormKey = GlobalKey<FormState>();
  final addressManageScreenController =
      Get.find<AddressManageScreenController>();
  TextEditingController contactPhoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactPersonNameController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController houseNoController = TextEditingController();
  TextEditingController addressHomeTypeController = TextEditingController();
  TextEditingController addressOfficeTypeController = TextEditingController();
  TextEditingController addressOtherController = TextEditingController();

  AddressData? selectedAddressValue;
  List<ZoneData> zoneList = [];

  // AddressData? selectedZoneId;
  RxString selectAddressValue = "Choose Address".obs;

  List<String> isAddressList = [
    "Choose Address",
    "Home",
    "Office",
  ];

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  ///button onpress function
  buttonOnpressButtonFunction() async {
    if (addAddressFormKey.currentState!.validate()) {
      await addUserAddressFunction();
    }
  }

  /// Get Zone List Function
  Future<void> getZoneListFunction() async {
    isLoading(true);
    String url = ApiUrl.zoneApi;
    log('getZoneListFunction Api Url : $url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      log('getZoneListFunction Response :${response.body}');

      ZoneModel zoneModel = ZoneModel.fromJson(json.decode(response.body));
      isSuccessStatus.value = zoneModel.success;

      if (isSuccessStatus.value) {
        zoneList.clear();
        if (zoneModel.data.isNotEmpty) {
          // zoneList.add(ZoneData(name: "Choose zone"));
          zoneList.addAll(zoneModel.data);
          selectedZoneValue = zoneList[0];
        }
        // log('selectedZoneValue : ${selectedZoneValue!.name}');
      } else {
        log('getZoneListFunction Else');
      }
    } catch (e) {
      log('getZoneListFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }

  selectValueFromDropdown(ZoneData value) {
    selectedZoneValue = value;
    isLoading(true);
    isLoading(false);
  }

  Future<void> addUserAddressFunction() async {
    isLoading(true);
    String url = ApiUrl.addUserAddessApi;
    log("addUserAddressFunction url: $url");
    try {
      String authorizationToken = await userPreference.getAuthorizationToken(
          key: UserPreference.userTokenKey);

      String finalToken = "Bearer $authorizationToken";

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['Accept'] = "application/json";
      request.headers['Authorization'] = finalToken;
      request.fields['contact_person_number'] = contactPhoneNoController.text;
      request.fields['address'] = addressController.text;
      request.fields['latitude'] = "63322";
      request.fields['longitude'] = "20222";
      request.fields['user_id'] = userId.toString();
      request.fields['contact_person_name'] = contactPersonNameController.text;
      request.fields['zone_id'] = "${selectedZoneValue!.id}";
      request.fields['landmark'] = landmarkController.text;
      request.fields['floor'] = floorController.text;
      request.fields['house_no'] = houseNoController.text;
      request.fields['address_type'] =
          selectAddressValue.value == "Home" ? "Home" : "Office";

      log("addUserAddressFunction request.fields: ${request.fields}");
      log("addUserAddressFunction request.headers: ${request.headers}");

      var response = await request.send();
      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        log("addUserAddressFunction value: $value");
        AddAddressModel addAddressModel =
            AddAddressModel.fromJson(json.decode(value));
        successStatus.value = addAddressModel.success;
        if (successStatus.value) {
          log("successStatus.value ${successStatus.value}");
          Fluttertoast.showToast(
            msg: addAddressModel.message,
            toastLength: Toast.LENGTH_SHORT,
          );
          Get.back();
          await addressManageScreenController.getUserAddressFUnction();
        }
      });
    } catch (e) {
      log("addUserAddressFunction catch: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<void> initMethod() async {
    userId = await userPreference.getStringValueFromPrefs(
            key: UserPreference.userIdKey) ??
        "";
    await getZoneListFunction();
  }
}
