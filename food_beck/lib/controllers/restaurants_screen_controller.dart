import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../constants/api_url.dart';
import '../constants/enums.dart';
import '../models/common_models/restaurant_data_model.dart';
import '../models/favorite_screen_model/add_favotite_restaurant_model.dart';
import '../models/favorite_screen_model/remove_favorite_restaurant_model.dart';
import '../models/home_screen_model/all_restaurant_model.dart';
import '../utils/user_preferences.dart';
import 'package:dio/dio.dart' as dio;

class RestaurantsScreenController extends GetxController {
  // Category Id & Cuisine Id same here
  String categoryId = Get.arguments[0] ?? "";
  // Category Name & Cuisine Name same here
  String categoryName = Get.arguments[1] ?? "";
  RestaurantComingFrom restaurantComingFrom = Get.arguments[2] ?? RestaurantComingFrom.category;

  RxBool isLoading = false.obs;
  RxBool successStatus = false.obs;
  final dioRequest = dio.Dio();

  List<RestaurantData> allRestaurantList = [];
  List<RestaurantData> vegRestaurantList = [];
  List<RestaurantData> nonVegRestaurantList = [];

  UserPreference userPreference = UserPreference();
  String zoneId = "";
  String userid = "";

  Future<void> getRestaurantsFunction() async {
    isLoading(true);
    String url = getRestaurantsApiUrl();
    log('getRestaurantsFunction Api Url : $url');

    try {
      final response = await dioRequest.get(url);
      log('getAllRestaurantFunction Response : ${response.data}');

      AllRestaurantModel allRestaurantModel = AllRestaurantModel.fromJson(response.data);
      successStatus.value = allRestaurantModel.success;

      if (successStatus.value) {
        if(allRestaurantModel.data.isNotEmpty) {
          allRestaurantList.clear();
          allRestaurantList.addAll(allRestaurantModel.data);
          for (var restaurant in allRestaurantList) {
            if (restaurant.veg == "1") {
              vegRestaurantList.add(restaurant);
            }
            if (restaurant.nonVeg == "1") {
              nonVegRestaurantList.add(restaurant);
            }
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

  // Get Restaurant APi Url using enum
  String getRestaurantsApiUrl() {
    String url = restaurantComingFrom == RestaurantComingFrom.category
        ? "${ApiUrl.getCategoryWiseRestaurantsApi}$zoneId/$categoryId"
        : restaurantComingFrom == RestaurantComingFrom.cuisines ?
    "${ApiUrl.getCuisinesRestaurantApi}$zoneId/$categoryId"
    : restaurantComingFrom == RestaurantComingFrom.popularRestaurants
    ? "${ApiUrl.getAllPopularRestaurantApi}$zoneId"
    : restaurantComingFrom == RestaurantComingFrom.newRestaurants
    ? "${ApiUrl.getNewRestaurantApi}$zoneId"
    : "";


    return url;
  }

  Future<void> addFavoriteRestaurantFunction({
    required String restaurantId,
    required RestaurantData singleRestaurant,
  }) async {
    String url = "${ApiUrl.addFavoriteRestaurantApi}$userid/$restaurantId";
    log("addFavoriteRestaurantFunction url: $url");
    try {
      String authorizationToken = await userPreference.getAuthorizationToken(
          key: UserPreference.userTokenKey);

      String finalToken = "Bearer $authorizationToken";
      final response = await dioRequest.post(
          url,
        options: dio.Options(
          headers: {
            "Accept": "application/json",
            "Authorization": finalToken,
          },
        ),
      );
      // http.Response response = await http.post(
      //   Uri.parse(url),
      //   headers: {
      //     "Accept": "application/json",
      //     "Authorization": finalToken,
      //   },
      // );

      log('addFavoriteRestaurantFunction response : ${response.data}');
      AddFavoriterestaurantModel addFavoriterestaurantModel =
          AddFavoriterestaurantModel.fromJson(response.data);

      successStatus.value = addFavoriterestaurantModel.success;
      if (successStatus.value) {
        Fluttertoast.showToast(msg: addFavoriterestaurantModel.message);
        // singlerestaurant.isFav = true;
      } else {
        Fluttertoast.showToast(msg: addFavoriterestaurantModel.message);
      }
    } catch (e) {
      log("addFavoriteRestaurantFunction catch: $e");
      rethrow;
    }
    isLoading(true);
    isLoading(false);
  }

  Future<void> removeFavoriteRestaurantFunction({
    required String restaurantId,
    required RestaurantData singleRestaurant,
  }) async {
    String url = "${ApiUrl.removeFavoriteRestaurantApi}$userid/$restaurantId";
    log("removeFavoriteRestaurantFunction url: $url");
    try {
      String authorizationToken = await userPreference.getAuthorizationToken(
          key: UserPreference.userTokenKey);

      String finalToken = "Bearer $authorizationToken";

      final response = await dioRequest.post(
        url,
        options: dio.Options(
          headers: {
            "Accept": "application/json",
            "Authorization": finalToken,
          },
        ),
      );
      /*http.Response response = await http.get(Uri.parse(url), headers: {
        "Accept": "application/json",
        "Authorization": finalToken,
      });*/

      log("removeFavoriteRestaurantFunction response :  ${response.data}");

      RemoveFavoriteRestaurantModel removeFavoriterestaurantModel =
      RemoveFavoriteRestaurantModel.fromJson(response.data);

      successStatus.value = removeFavoriterestaurantModel.success;
      if (successStatus.value) {
        Fluttertoast.showToast(msg: removeFavoriterestaurantModel.message);
        // singlerestaurant.isFav = false;
      } else {
        Fluttertoast.showToast(msg: removeFavoriterestaurantModel.message);
      }
    } catch (e) {
      log("removeFavoriteRestaurantFunction catch: $e");
      rethrow;
    }
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    zoneId = await userPreference.getStringValueFromPrefs(key: UserPreference.userZoneIdKey) ?? "1";
    userid = await userPreference.getStringValueFromPrefs(key: UserPreference.userIdKey) ?? "1";
    await getRestaurantsFunction();
  }
}
