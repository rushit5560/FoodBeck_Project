import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../constance/api_url.dart';
import '../constance/enums.dart';
import '../model/address_screen_model/add_address_model.dart';
import '../model/address_screen_model/get_by_id_adress_model.dart';
import '../model/address_screen_model/update_address_model.dart';
import '../model/sign_up_model/zone_model.dart';
import '../utils/user_preferences.dart';
import 'package:http/http.dart' as http;

import 'address_list_screen_controller.dart';


class AddressManageScreenController extends GetxController {
  AddressOption addressOption = Get.arguments[0];
  String addressId = Get.arguments[1];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  String userId = "";
  RxBool successStatus = false.obs;
  ZoneData? selectedZoneValue;

  UserPreference userPreference = UserPreference();
  GlobalKey<FormState> addAddressFormKey = GlobalKey<FormState>();
  final addressManageScreenController =
      Get.find<AddressListScreenController>();
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
      if (addressOption == AddressOption.add) {
        await addUserAddressFunction();
      } else if (addressOption == AddressOption.edit) {
        await updateUserAddressFunction();
      }
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

  Future<void> getByIdUserAddressFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getByIdUserAddressApi}$addressId";
    log("getByIdUserAddressFunction url: $url");
    try {
      String authorizationToken = await userPreference.getAuthorizationToken(
          key: UserPreference.userTokenKey);

      String finalToken = "Bearer $authorizationToken";
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": finalToken,
        },
      );
      GetByIdUserAddressModel getByIdUserAddressModel =
          GetByIdUserAddressModel.fromJson(json.decode(response.body));
      log("getByIdUserAddressFunction response: ${response.body}");
      isSuccessStatus = getByIdUserAddressModel.success.obs;
      if (isSuccessStatus.value) {
        selectAddressValue.value =
            getByIdUserAddressModel.data.addressType == "Home"
                ? "Home"
                : "Office";
        contactPersonNameController.text =
            getByIdUserAddressModel.data.contactPersonName;
        houseNoController.text = getByIdUserAddressModel.data.houseNo;
        floorController.text = getByIdUserAddressModel.data.floor;
        contactPhoneNoController.text =
            getByIdUserAddressModel.data.contactPersonNumber;
        addressController.text = getByIdUserAddressModel.data.address;
        landmarkController.text = getByIdUserAddressModel.data.landmark;
        for (int i = 0; i < zoneList.length; i++) {
          if (getByIdUserAddressModel.data.zoneId == zoneList[i].id) {
            selectedZoneValue = zoneList[i];
          }
        }
      } else {
        Fluttertoast.showToast(msg: getByIdUserAddressModel.message);
      }
    } catch (e) {
      log("getByIdUserAddressFunction catch: $e");
      rethrow;
    }
    isLoading(false);
  }

  Future<void> updateUserAddressFunction() async {
    isLoading(true);
    String url = "${ApiUrl.updateUserAddressApi}$addressId";
    log("updateAddressFunction url: $url");
    try {
      String authorizationToken = await userPreference.getAuthorizationToken(
          key: UserPreference.userTokenKey);

      String finalToken = "Bearer $authorizationToken";

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers['Accept'] = "application/json";
      request.headers['Authorization'] = finalToken;
      request.fields['address_type'] =
          selectAddressValue.value == "Home" ? "Home" : "Office";
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

      log("updateAddressFunction request.fields: ${request.fields}");
      log("updateAddressFunction request.headers: ${request.headers}");

      var response = await request.send();
      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        UpdateUserAddressModel updateUserAddressModel =
            UpdateUserAddressModel.fromJson(json.decode(value));

        successStatus.value = updateUserAddressModel.success;
        if (successStatus.value) {
          log("successStatus.value ${successStatus.value}");
          Fluttertoast.showToast(
            msg: updateUserAddressModel.message,
            toastLength: Toast.LENGTH_SHORT,
          );
          Get.back();
          await addressManageScreenController.getUserAddressFUnction();
        }
      });
    } catch (e) {
      log("updateAddressFunction catch: $e");
      rethrow;
    }
    isLoading(false);
  }

  Future<void> addUserAddressFunction() async {
    isLoading(true);
    String url = ApiUrl.addUserAddressApi;
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

    if (addressOption == AddressOption.edit) {
      await getByIdUserAddressFunction();
    }
  }
}
