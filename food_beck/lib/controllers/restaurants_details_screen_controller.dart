import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_beck/models/common_models/food_data_model.dart';
import 'package:get/get.dart';
import '../constants/api_url.dart';
import '../models/cart_screen_model/add_to_cart_model.dart';
import '../models/cart_screen_model/cart_update_model.dart';
import '../models/restaurants_details_screen_model/restaurant_food_model.dart';
import '../models/restaurants_details_screen_model/restaurants_details_model.dart';
import 'package:dio/dio.dart' as dio;

import '../utils/user_preferences.dart';
import 'package:http/http.dart' as http;

class RestaurantsDetailsScreenController extends GetxController {
  String restaurantId = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool successStatus = false.obs;

  List<RestaurantDetails> popularRestaurantsList = [];
  String coverImage = '';
  String restaurantLogo = "";
  String restaurantName = "";
  String restaurantDescription = "";
  String restaurantAddress = "";
  int ratingCount = 0;
  String overallRating = "";
  String deliveryTime = "";
  String authorizationToken = "";
  String userId = "";
  AddCartData? addCartData;
  RxBool isCartStatus = false.obs;
  RxBool isUserLoggedInKey = false.obs;
  RxBool isCartIsEmptyKey = true.obs;
  String prefCartRestaurantId = "";
  String cartId = "";

  RxInt itemCount = 1.obs;

  // RxDouble finalAmount = 0.0.obs;

  final dioRequest = dio.Dio();

  List<FoodData> allFoodList = [];
  FoodDetails? foodDetails;

  // List<FoodDetails> vegFoodList = [];
  // List<FoodDetails> nonVegFoodList = [];

  /// Get Restaurant details function
  Future<void> getRestaurantsDetailsFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getPRestaurantDetailsApi}$restaurantId";
    log("getUserProfileFunction Api Url : $url");
    log("getRestaurantsDetailsFunction restaurantId $restaurantId");

    try {
      // http.Response response = await http.get(Uri.parse(url));
      final response = await dioRequest.get(url);
      log("getRestaurantsDetailsFunction response :  ${response.data}");

      GetRestaurantDetailsModel getRestaurantDetailsModel =
          GetRestaurantDetailsModel.fromJson(response.data);
      successStatus.value = getRestaurantDetailsModel.success;

      log("successStatus.value ${successStatus.value}");
      if (successStatus.value) {
        popularRestaurantsList.addAll(getRestaurantDetailsModel.data);
        log("getRestaurantsDetailsFunction popularRestaurantsList $popularRestaurantsList");
        coverImage = ApiUrl.restaurantImagePathUrl +
            getRestaurantDetailsModel.data[0].coverPhoto;
        restaurantLogo = ApiUrl.restaurantImagePathUrl +
            getRestaurantDetailsModel.data[0].logo;
        restaurantName = getRestaurantDetailsModel.data[0].name;
        restaurantDescription = getRestaurantDetailsModel.data[0].description;
        restaurantAddress = getRestaurantDetailsModel.data[0].address;
        overallRating = getRestaurantDetailsModel.data[0].rating;
        // ratingCount = int.parse(getRestaurantDetailsModel.data[0].rating ?? "0");
        deliveryTime = getRestaurantDetailsModel.data[0].deliveryTime;

        log("image 11 $coverImage");
      }
    } catch (e) {
      log("getRestaurantsDetailsFunction catch: $e");
      rethrow;
    }
    // isLoading(false);
    await getRestaurantFoodFunction();
  }

  /// Get Restaurant Food Details
  Future<void> getRestaurantFoodFunction() async {
    isLoading(true);
    String url = "${ApiUrl.allProductsApi}$restaurantId";
    log('getRestaurantFoodFunction Api Url :$url');

    try {
      // http.Response response = await http.get(Uri.parse(url));
      final response = await dioRequest.get(url);
      log("getRestaurantFoodFunction  response : ${jsonEncode(response.data)}");
      RestaurantFoodModel restaurantFoodModel =
          RestaurantFoodModel.fromJson(response.data);
      successStatus.value = restaurantFoodModel.success;

      if (successStatus.value) {
        allFoodList.clear();
        // vegFoodList.clear();
        // nonVegFoodList.clear();

        allFoodList.addAll(restaurantFoodModel.data);
        /*for(var element in allFoodList) {
          // If Food Veg category then add in vegFoodList
          if(element.veg == 1) {
            vegFoodList.add(element);
          }
          // If Food Non-Veg category then add in nonVegFoodList
          if(element.veg == 0) {
            nonVegFoodList.add(element);
          }
        }*/
      } else {
        log('getRestaurantFoodFunction Else');
      }
    } catch (e) {
      log('getRestaurantFoodFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }

  /// Product add in cart function
  Future<void> productAddInCartFunction() async {
    isLoading(true);
    String url = ApiUrl.addToCartApi;
    log('Add to cart api url :$url');

    try {} catch (e) {
      log('productAddInCartFunction Error :$e');
    }
    isLoading(false);
  }

  Future<void> cartUpdateFunction(
      {required String cartId,
      required String foodId,
      required String qty,
      required String subTotal}) async {
    isLoading(true);

    String url = "${ApiUrl.cartUpdate}$cartId/$foodId";
    log("cartUpdateFunction url: $url");
    String authorizationToken = await userPreference.getAuthorizationToken(
        key: UserPreference.userTokenKey);

    String finalToken = "Bearer $authorizationToken";

    var request = http.MultipartRequest('POST', Uri.parse(url));
    try {
      request.headers['Accept'] = "application/json";
      request.headers['Authorization'] = finalToken;
      request.fields['quantity'] = qty;
      request.fields['subtotal'] = subTotal;
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
            Get.back();
          }
        },
      );
    } catch (e) {
      log("addToCartFunction catch $e");
    }
    isLoading(false);
  }

  /// add to cart
  Future<void> addToCartFunction({
    required String foodId,
    required String foodRestaurantId,
    required int quantity,
    required double subtotal,
  }) async {
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
      request.fields['restaurant_id'] = restaurantId;
      request.fields['food_id'] = foodId;
      request.fields['quantity'] = quantity.toString();
      request.fields['subtotal'] = subtotal.toString();
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

          log("restaurantId $restaurantId, foodRestaurantId $foodRestaurantId");

          if (successStatus.value) {
            log("if");

            /// Set cart value in prefs
            userPreference.setBoolValueInPrefs(
                key: UserPreference.cartIsEmptyKey, value: false);
            userPreference.setStringValueInPrefs(
                key: UserPreference.cartRestaurantIdKey, value: restaurantId);
            userPreference.setStringValueInPrefs(
                key: UserPreference.cartIdKey,
                value: addToCartModel.data!.cartDetails!.cartId.toString());

            /// Get Cart value from prefs
            isCartIsEmptyKey.value = await userPreference.getBoolFromPrefs(
                key: UserPreference.cartIsEmptyKey);
            prefCartRestaurantId = await userPreference.getStringValueFromPrefs(
                    key: UserPreference.cartRestaurantIdKey) ??
                "";
            cartId = await userPreference.getStringValueFromPrefs(
                    key: UserPreference.cartIdKey) ??
                "";

            log("restaurantId $restaurantId");
            log("successStatus.value ${successStatus.value}");
            log("addToCartModel.message ${addToCartModel.message}");
            Fluttertoast.showToast(
              msg: addToCartModel.message,
              toastLength: Toast.LENGTH_SHORT,
            );
            Get.back();
          } else {
            log("else");
            log("addToCartModel.error ${addToCartModel.error}");
            //todo
            if (addToCartModel.error.toLowerCase() !=
                    "Cart item already added".toLowerCase() ||
                addToCartModel.error.toLowerCase() ==
                    "Please clear cart before adding another restaurant product"
                        .toLowerCase()) {
              await cartUpdateFunction(
                qty: quantity.toString(),
                subTotal: subtotal.toString(),
                foodId: foodId,
                cartId: cartId,
              );
            }

            if (addToCartModel.error.toLowerCase() ==
                "Cart item already added".toLowerCase()) {
              Fluttertoast.showToast(msg: addToCartModel.error);
              Get.back();
            }

            // Fluttertoast.showToast(
            //   msg: addToCartModel.error,
            //   toastLength: Toast.LENGTH_SHORT,
            // );
            // Get.back();
          }
        },
      );
    } catch (e) {
      log("addToCartFunction catch $e");
    }
    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    isUserLoggedInKey.value = await userPreference.getBoolFromPrefs(
        key: UserPreference.isUserLoggedInKey);

    isCartIsEmptyKey.value = await userPreference.getBoolFromPrefs(
        key: UserPreference.cartIsEmptyKey);
    log("isCartIsEmptyKey.value ${isCartIsEmptyKey.value}");

    prefCartRestaurantId = await userPreference.getStringValueFromPrefs(
            key: UserPreference.cartRestaurantIdKey) ??
        "";
    log("prefCartRestaurantId =  $prefCartRestaurantId");
    cartId = await userPreference.getStringValueFromPrefs(
            key: UserPreference.cartIdKey) ??
        "";
    log("cartId =  $cartId");

    userId = await userPreference.getStringValueFromPrefs(
            key: UserPreference.userIdKey) ??
        "";
    log("userId $userId");
    authorizationToken = await userPreference.getAuthorizationToken(
        key: UserPreference.userTokenKey);
    isCartStatus.value = await userPreference.getBoolFromPrefs(
        key: UserPreference.cartIsEmptyKey);
    await getRestaurantsDetailsFunction();
  }
}
