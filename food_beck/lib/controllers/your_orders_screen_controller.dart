import 'dart:convert';
import 'dart:developer';
import 'package:food_beck/constants/api_url.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../models/your_orders_screen_model/order_list_model.dart';
import '../utils/user_preferences.dart';


class YourOrdersScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final dioRequest = dio.Dio();
  String userId = "";
  UserPreference userPreference = UserPreference();

  List onGoingOrdersList = [1,2,3,4,5,6,7,8,9,0];
  List completeOrderList = [1,2,3,4,5,6,7,8,9,0];

  Future<void> getUserOrdersFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getUserOrdersApi}$userId";
    log('getUserOrdersFunction Api Url :$url');

    try {
      String authorizationToken = await userPreference.getAuthorizationToken(
          key: UserPreference.userTokenKey);

      String finalToken = "Bearer $authorizationToken";

      final response = await dioRequest.get(
        url,
        options: dio.Options(
          headers: {
            "Accept": "application/json",
            "Authorization": finalToken,
          },
        ),
      );

      log('response :${jsonEncode(response.data)}');

      OrderListModel orderListModel = OrderListModel.fromJson(response.data);
      isSuccessStatus.value = orderListModel.success;

      if(isSuccessStatus.value) {

      } else {
        log('getUserOrdersFunction Else');
      }

    } catch(e) {
      log('getUserOrdersFunction Error :$e');
    }
    isLoading(false);

  }


  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    userId = await userPreference.getStringValueFromPrefs(key: UserPreference.userIdKey) ?? "";
    log('userId : $userId');
    await getUserOrdersFunction();
  }
}