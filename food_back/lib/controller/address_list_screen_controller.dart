import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_back/constance/api_url.dart';
import 'package:food_back/utils/user_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/address_screen_model/delete_user_address_model.dart';
import '../model/address_screen_model/user_address_model.dart';

class AddressListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  String userId = "";

  List<AddressData> userAddressList = [];

  UserPreference userPreference = UserPreference();

  // Get User Address
  Future<void> getUserAddressFUnction() async {
    isLoading(true);
    String url = "${ApiUrl.getUserAddressApi}$userId";
    log('getUserAddressFUnction Api Url : $url');

    try {
      Map<String, String> header = await ApiHeader().getHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log('getUserAddressFUnction Response : ${response.body}');

      UserAddressModel userAddressModel =
          UserAddressModel.fromJson(json.decode(response.body));
      isSuccessStatus.value = userAddressModel.success;

      if (isSuccessStatus.value) {
        userAddressList.clear();
        userAddressList.addAll(userAddressModel.data);
        log('userAddressList Length : ${userAddressList.length}');
      } else {
        log('getUserAddressFUnction Else');
      }
    } catch (e) {
      log('getUserAddressFUnction Error :$e');
      rethrow;
    }

    isLoading(false);
  }

  // Delete user Address
  Future<void> deleteUserAddressFunction(String addressId, int index) async {
    isLoading(true);
    String url = "${ApiUrl.deleteUserAddressApi}$addressId";
    log('deleteUserAddressFunction Api Url : $url');

    try {
      Map<String, String> header = await ApiHeader().getHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log('deleteUserAddressFunction Response : ${response.body}');

      DeleteAddressModel deleteAddressModel =
          DeleteAddressModel.fromJson(json.decode(response.body));
      isSuccessStatus.value = deleteAddressModel.success;

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: deleteAddressModel.message);
        userAddressList.removeAt(index);
        Get.back();
        // await getUserAddressFUnction();
      } else {
        log('deleteUserAddressFunction Else');
      }
    } catch (e) {
      log('deleteUserAddressFunction Error :$e');
      rethrow;
    }

    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    userId = await userPreference.getStringValueFromPrefs(
            key: UserPreference.userIdKey) ??
        "";
    await getUserAddressFUnction();
  }
}
