import 'dart:developer';
import 'package:food_beck/constants/api_url.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../models/cart_screen_model/cart_model.dart';
import '../utils/user_preferences.dart';

class CartScreenController extends GetxController {
  RxInt qty = 1.obs;
  RxBool isLoading = false.obs;
  RxDouble subTotalAmount = 0.0.obs;
  int productPrice = 150;
  String userId = "";
  double? itemTotalPrice;
  RxDouble itemAddonPrice = 0.0.obs;
  List offersList = [1, 2, 3, 4, 5];
  RxDouble offerAmount = 0.0.obs;
  RxBool appliedOffer = false.obs;
  List addressList = [1, 2, 3, 4, 5];
  final dioRequest = dio.Dio();
  RxBool successStatus = false.obs;
  List<CartData> getCartList = [];
  String authorizationToken = "";

  Future<void> getCartListFunction() async {
    log("getCartFunction");
    isLoading(true);
    String url = "${ApiUrl.getCartApi}$userId";
    log("getCartFunction api url: $url");
    String authorizationToken = await userPreference.getAuthorizationToken(
        key: UserPreference.userTokenKey);
    log("Bearer $authorizationToken");

    String finalToken = "Bearer $authorizationToken";
    try {
      final response = await dioRequest.get(
        url,
        options: dio.Options(
          headers: {
            "Accept": "application/json",
            "Authorization": finalToken,
          },
        ),
      );
      log("getCartFunction response.data ${response.data}");
      CartModel cartModel = CartModel.fromJson(response.data);
      successStatus.value = cartModel.success;
      if (successStatus.value) {
        log("successStatus.value ${successStatus.value}");
        getCartList.clear();
        getCartList.addAll(cartModel.data);
      }
      log("getCartList.length ${getCartList.length}");
    } catch (e) {
      log("getCartFunction catch: $e");
    }
    isLoading(false);
  }

  Future<void> addToCartFunction() async {
    isLoading(true);
    String url=ApiUrl.addToCartApi;
    log("addToCartFunction url: $url");
    String authorizationToken = await userPreference.getAuthorizationToken(
        key: UserPreference.userTokenKey);
    log("Bearer $authorizationToken");
    try{
      var formData = dio.FormData.fromMap({
        "user_id": userId,
        "restaurant_id": "6",
        "food_id":"1",
        "quantity": "2",
        "subtotal": "150",
      });
      // AddToCartModel
    }catch(e){

    }
    isLoading(false);
  }

  void increment() {
    qty.value++;
    subTotalAmount.value = (productPrice * qty.value).toDouble();
    itemTotalPrice = subTotalAmount.value + itemAddonPrice.value;
    log("itemTotalPrice $itemTotalPrice");
    loadUI();
  }

  void decrement() {
    if (qty > 1) {
      qty.value--;
      subTotalAmount.value = (productPrice * qty.value).toDouble();
      itemTotalPrice = subTotalAmount.value + itemAddonPrice.value;
    }
    loadUI();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  Future<void> initMethod() async {
    userId = await userPreference.getStringValueFromPrefs(
            key: UserPreference.userIdKey) ??
        "";
    log("userId $userId");
    authorizationToken = await userPreference.getAuthorizationToken(
        key: UserPreference.userTokenKey);
    // await getCartFunction();
  }

  @override
  void onInit() {
    log("11");
    initMethod();
    super.onInit();
  }

  @override
  void onReady() {
    log("1122");
    super.onReady();
  }
}
