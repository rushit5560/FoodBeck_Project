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
  int productPrice = 0;
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
  List<CartDetail> getCartList = [];
  String authorizationToken = "";
  String cartId = "";

  // CartData? cartData;
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

        getCartList.addAll(cartModel.data[0].cartDetails);
      }
      log("getCartList.length ${getCartList.length}");
    } catch (e) {
      log("getCartFunction catch: $e");
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
  Future<void> deleteCartItemFunction(
      {required String cartId,
      required String itemId,
      required int index}) async {
    isLoading(true);
    String url = "${ApiUrl.deleteItemApi}$cartId/$itemId";
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
  Future<void> deleteWholeCartFunction({required int index}) async {
    isLoading(true);
    String url = "${ApiUrl.deleteWholeCartApi}$cartId";
    log('deleteWholeCartFunction Api Url : $url');
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
      log("deleteWholeCartFunction response.data ${response.data}");

      CartDeleteModel cartDeleteModel = CartDeleteModel.fromJson(response.data);
      successStatus.value = cartDeleteModel.success;

      if (successStatus.value) {
        Get.back();
        Fluttertoast.showToast(msg: cartDeleteModel.message);
        getCartList.removeAt(index);
        // await getUserAddressFUnction();
      } else {
        log('deleteWholeCartFunction Else');
        Fluttertoast.showToast(msg: cartDeleteModel.error);
      }
    } catch (e) {
      log('deleteWholeCartFunction Error :$e');
      rethrow;
    }

    isLoading(false);
  }

  void increment(CartDetail food, int index) {
    int itemQty = int.parse(food.quantity);
    itemQty++;
    food.quantity = itemQty.toString();
    log("food.quantity ${food.quantity}");
    // subTotalAmount.value=()
    // qty.value++;
    // subTotalAmount.value = (productPrice * qty.value).toDouble();
    // itemTotalPrice = subTotalAmount.value + itemAddonPrice.value;
    // log("itemTotalPrice $itemTotalPrice");
    loadUI();
  }

  Future<void> decrement(CartDetail food, int index) async {
    // If Cart item list length 1 & item qty also 1 that time delete whole cart
    if (getCartList.length == 1) {
      if (int.parse(food.quantity) > 1) {
        // here cart item qty decrement function
        int itemQty = int.parse(food.quantity);
        itemQty--;
        food.quantity = itemQty.toString();
      } else {
        await deleteWholeCartFunction(index: index);
      }
    }
    // if Cart item list length more then 1
    else {
      if (int.parse(food.quantity) > 1) {
        // here cart item qty decrement function
        int itemQty = int.parse(food.quantity);
        itemQty--;
        food.quantity = itemQty.toString();
      } else if (int.parse(food.quantity) < 2) {
        /// here cart item delete api
        log("here cart item delete api");
        await deleteCartItemFunction(
          index: index,
          cartId: food.cartId,
          itemId: food.foodId.toString(),
        );
      }
    }

    // else if (getCartList.length == 1 && int.parse(food.quantity) == 1) {
    //   /// whole cart delete api
    //   log("whole cart delete api");
    //   await deleteWholeCartFunction(index: index);
    // }
    // if (qty > 1) {
    //   qty.value--;
    //   subTotalAmount.value = (productPrice * qty.value).toDouble();
    //   itemTotalPrice = subTotalAmount.value + itemAddonPrice.value;
    // }
    loadUI();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  Future<void> initMethod() async {
    authorizationToken = await userPreference.getAuthorizationToken(
        key: UserPreference.userTokenKey);
    userId = await userPreference.getStringValueFromPrefs(
            key: UserPreference.userIdKey) ??
        "";
    log("userId $userId");
    cartId = await userPreference.getStringValueFromPrefs(
            key: UserPreference.cartIdKey) ??
        "";
    log("cartId =  $cartId");

    await getCartListFunction();
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
