import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_beck/constants/api_url.dart';
import 'package:food_beck/models/cart_screen_model/add_to_cart_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../models/cart_screen_model/cart_delete_model.dart';
import '../models/cart_screen_model/cart_model.dart';
import '../models/cart_screen_model/cart_update_model.dart';
import '../utils/user_preferences.dart';
import 'package:http/http.dart' as http;

class CartScreenController extends GetxController {
  RxInt qty = 1.obs;
  RxBool isLoading = false.obs;
  RxDouble subTotalAmount = 0.0.obs;
  int productPrice = 150;
  String userId = "";
  String foodId = "1";
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

  /// get cart
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

  /// add to cart
  Future<void> addToCartFunction() async {
    isLoading(true);
    String url = ApiUrl.addToCartApi;
    log("addToCartFunction url: $url");
    String authorizationToken = await userPreference.getAuthorizationToken(
        key: UserPreference.userTokenKey);

    String finalToken = "Bearer $authorizationToken";

    var request = http.MultipartRequest('POST', Uri.parse(url));
    try {
      request.headers['Accept'] = "application/json";
      request.headers['Authorization'] = finalToken;
      request.fields['user_id'] = userId;
      request.fields['restaurant_id'] = "6";
      request.fields['food_id'] = "1";
      request.fields['quantity'] = "2";
      request.fields['subtotal'] = "120";
      log("request.fields ${request.fields}");
      var response = await request.send();
      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen(
        (value) async {
          AddToCartModel addToCartModel =
              AddToCartModel.fromJson(json.decode(value));
          successStatus.value = addToCartModel.success;
          if (successStatus.value) {
            log("successStatus.value ${successStatus.value}");
            Fluttertoast.showToast(
              msg: addToCartModel.message,
              toastLength: Toast.LENGTH_SHORT,
            );
            Get.back();
          } else {
            Fluttertoast.showToast(
              msg: addToCartModel.error,
              toastLength: Toast.LENGTH_SHORT,
            );
          }
        },
      );
    } catch (e) {
      log("addToCartFunction catch $e");
    }
    isLoading(false);
  }

  Future<void> cartUpdateFunction() async {
    isLoading(true);

    String url = "${ApiUrl.cartUpdate}$userId/$foodId";
    log("cartUpdateFunction url: $url");
    String authorizationToken = await userPreference.getAuthorizationToken(
        key: UserPreference.userTokenKey);

    String finalToken = "Bearer $authorizationToken";

    var request = http.MultipartRequest('POST', Uri.parse(url));
    try {
      request.headers['Accept'] = "application/json";
      request.headers['Authorization'] = finalToken;
      request.fields['quantity'] = "2";
      request.fields['subtotal'] = "120";
      log("request.fields ${request.fields}");
      var response = await request.send();
      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen(
        (value) async {
          CartUpdateModel cartUpdateModel =
              CartUpdateModel.fromJson(json.decode(value));
          successStatus.value = cartUpdateModel.success;
          if (successStatus.value) {
            log("successStatus.value ${successStatus.value}");
            Fluttertoast.showToast(
              msg: cartUpdateModel.message,
              toastLength: Toast.LENGTH_SHORT,
            );
            Get.back();
          } else {
            Fluttertoast.showToast(
              msg: cartUpdateModel.error,
              toastLength: Toast.LENGTH_SHORT,
            );
          }
        },
      );
    } catch (e) {
      log("addToCartFunction catch $e");
    }
    isLoading(false);
  }

  /// Delete cart item
  Future<void> deleteCartItemFunction(String itemId, int index) async {
    isLoading(true);
    String url = "${ApiUrl.deleteItemApi}$itemId";
    log('deleteCartItemFunction Api Url : $url');
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

      CartDeleteModel cartDeleteModel = CartDeleteModel.fromJson(response.data);

      successStatus.value = cartDeleteModel.success;

      if (successStatus.value) {
        Get.back();
        Fluttertoast.showToast(msg: cartDeleteModel.message);
        getCartList.removeAt(index);
        // await getUserAddressFUnction();
      } else {
        log('deleteCartItemFunction Else');
      }
    } catch (e) {
      log('deleteCartItemFunction Error :$e');
      rethrow;
    }

    isLoading(false);
  }

  /// Delete cart
  Future<void> deleteCartFunction(String cartId, int index) async {
    isLoading(true);
    String url = "${ApiUrl.deleteWholeCartApi}$cartId";
    log('deleteCartFunction Api Url : $url');
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

      CartDeleteModel cartDeleteModel = CartDeleteModel.fromJson(response.data);
      successStatus.value = cartDeleteModel.success;

      if (successStatus.value) {
        Get.back();
        Fluttertoast.showToast(msg: cartDeleteModel.message);
        getCartList.removeAt(index);
        // await getUserAddressFUnction();
      } else {
        log('deleteCartFunction Else');
      }
    } catch (e) {
      log('deleteCartFunction Error :$e');
      rethrow;
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
