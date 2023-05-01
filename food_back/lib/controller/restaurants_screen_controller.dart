import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:food_back/constance/api_url.dart';
import 'package:food_back/utils/user_preferences.dart';
import 'package:get/get.dart';

import '../constance/enums.dart';
import '../model/home_screen_model/all_restaurant_model.dart';

class RestaurantsScreenController extends GetxController {
  String categoryId = Get.arguments[0] ?? ""; // Category Id & Cuisine Id same here
  String categoryName = Get.arguments[1] ?? ""; // Category Name & Cuisine Name same here
  RestaurantComingFrom restaurantComingFrom = Get.arguments[2] ?? RestaurantComingFrom.category;


  RxBool isLoading = false.obs;
  RxBool successStatus = false.obs;

  List<RestaurantDetails> allRestaurantList = [];
  List<RestaurantDetails> vegRestaurantList = [];
  List<RestaurantDetails> nonVegRestaurantList = [];

  UserPreference userPreference = UserPreference();
  String zoneId = "";

  Future<void> getRestaurantsFunction() async {
    isLoading(true);
    String url = restaurantComingFrom == RestaurantComingFrom.category
    ? "${ApiUrl.getCategoryWiseRestaurantsApi}$zoneId/$categoryId"
    : "${ApiUrl.getCuisinesRestaurantApi}$zoneId/$categoryId";
    log('getRestaurantsFunction Api Url : $url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      log('getAllRestaurantFunction Response : ${response.body}');

      AllRestaurantModel allRestaurantModel =
          AllRestaurantModel.fromJson(json.decode(response.body));
      successStatus.value = allRestaurantModel.success;

      if (successStatus.value) {
        allRestaurantList.clear();
        allRestaurantList.addAll(allRestaurantModel.data);
        for(var restaurant in allRestaurantList) {
          if(restaurant.veg == 1) {
            vegRestaurantList.add(restaurant);
          }
          if(restaurant.nonVeg == 1) {
            nonVegRestaurantList.add(restaurant);
          }
        }
        log('allRestaurantList Length : ${allRestaurantList.length}');
      } else {
        log('getAllRestaurantFunction Else');
      }
    } catch (e) {
      log('getAllRestaurantFunction Error :$e');
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
    zoneId = await userPreference.getStringValueFromPrefs(key: UserPreference.userZoneIdKey) ?? "";
    await getRestaurantsFunction();
  }
}