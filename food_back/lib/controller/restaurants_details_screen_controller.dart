import 'dart:convert';
import 'dart:developer';
import 'package:food_back/model/restaurants_details_screen_model/restaurants_details_model.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

import '../constance/api_url.dart';
import '../model/restaurants_details_screen_model/restaurant_food_model.dart';

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

  List<FoodDetails> allFoodList = [];
  List<FoodDetails> vegFoodList = [];
  List<FoodDetails> nonVegFoodList = [];




  // Get Restaurant details function
  Future<void> getRestaurantsDetailsFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getPRestaurantDetailsApi}$restaurantId";
    log("getUserProfileFunction Api Url : $url");
    log("getRestaurantsDetailsFunction restaurantId $restaurantId");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("getRestaurantsDetailsFunction response :  ${response.body}");

      GetRestaurantDetailsModel getRestaurantDetailsModel =
          GetRestaurantDetailsModel.fromJson(json.decode(response.body));
      successStatus.value = getRestaurantDetailsModel.success;

      log("successStatus.value ${successStatus.value}");
      if (successStatus.value) {
        popularRestaurantsList.addAll(getRestaurantDetailsModel.data);
        log("getRestaurantsDetailsFunction popularRestaurantsList $popularRestaurantsList");
        coverImage = ApiUrl.restaurantImagePathUrl + getRestaurantDetailsModel.data[0].coverPhoto;
        restaurantLogo = ApiUrl.restaurantImagePathUrl + getRestaurantDetailsModel.data[0].logo;
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

  Future<void> getRestaurantFoodFunction() async {
    isLoading(true);
    String url = "${ApiUrl.allProductsApi}$restaurantId";
    log('getRestaurantFoodFunction Api Url :$url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("getRestaurantFoodFunction  response : ${response.body}");
      RestaurantFoodModel restaurantFoodModel = RestaurantFoodModel.fromJson(json.decode(response.body));
      successStatus.value = restaurantFoodModel.success;

      if(successStatus.value) {
        allFoodList.clear();
        vegFoodList.clear();
        nonVegFoodList.clear();

        allFoodList.addAll(restaurantFoodModel.data);
        for(var element in allFoodList) {
          // If Food Veg category then add in vegFoodList
          if(element.veg == 1) {
            vegFoodList.add(element);
          }
          // If Food Non-Veg category then add in nonVegFoodList
          if(element.veg == 0) {
            nonVegFoodList.add(element);
          }
        }
      } else {
        log('getRestaurantFoodFunction Else');
      }


    } catch(e) {
      log('getRestaurantFoodFunction Error :$e');
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
    await getRestaurantsDetailsFunction();
  }

}
