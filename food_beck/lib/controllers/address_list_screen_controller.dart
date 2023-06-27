import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/api_url.dart';
import '../models/address_screen_model/delete_user_address_model.dart';
import '../models/address_screen_model/user_address_model.dart';
import '../utils/user_preferences.dart';
import 'package:dio/dio.dart' as dio;

class AddressListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final dioRequest = dio.Dio();
  String authorizationToken = "";
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
      log("authorizationToken $authorizationToken");
      final response = await dioRequest.get(
        url,
        options: dio.Options(headers: header),
      );
      log("getUserProfileFunction response :  ${jsonEncode(response.data)}");
      UserAddressModel userAddressModel =
          UserAddressModel.fromJson(response.data);

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
        Get.back();
        Fluttertoast.showToast(msg: deleteAddressModel.message);
        userAddressList.removeAt(index);
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
    authorizationToken = await userPreference.getAuthorizationToken(
        key: UserPreference.userTokenKey);
    userId = await userPreference.getStringValueFromPrefs(
            key: UserPreference.userIdKey) ??
        "";
    await getUserAddressFUnction();
  }
}
