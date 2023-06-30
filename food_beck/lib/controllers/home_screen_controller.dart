import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:developer';
import '../constants/api_url.dart';
import '../models/common_models/food_data_model.dart';
import '../models/common_models/restaurant_data_model.dart';
import '../models/home_screen_model/all_restaurant_model.dart';
import '../models/home_screen_model/best_reviewed_food_model.dart';
import '../models/home_screen_model/category_model.dart';
import '../models/home_screen_model/cuisine_model.dart';
import '../models/home_screen_model/new_restaurant_model.dart';
import '../models/home_screen_model/popular_food_near_by_you_model.dart';
import '../models/home_screen_model/popular_restaurants_model.dart';
import '../models/home_screen_model/trending_food_model.dart';
import '../models/recipes_screen_model/banner_model.dart';
import '../utils/user_preferences.dart';
import 'package:dio/dio.dart' as dio;

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool successStatus = false.obs;
  String zoneId = "";

  RxBool isFoodDetailsLoading = false.obs;
  RxBool isFoodDetailsSuccessStatus = false.obs;

  UserPreference userPreference = UserPreference();
  final dioRequest = dio.Dio();

  RxBool isLiked = false.obs;
  List<BannerList> bannerList = [];
  List<CategoryData> categoryList = [];

  // List<TakeYourPickProduct> allProductsList = [];
  List<RestaurantData> allPopularRestaurantList = [];
  List<FoodData> trendingFoodList = [];
  List<FoodData> popularFoodNearbyList = [];
  List<RestaurantData> newRestaurantList = [];
  List<FoodData> bestReviewedFoodList = [];
  List<RestaurantData> allRestaurantList = [];
  List<CuisineDetails> cuisinesList = [];
  RxString address = ''.obs;

  // FoodData selectedFoodData = FoodData();

  RxInt currentIndex = 0.obs;
  TextEditingController searchbarController = TextEditingController();
  final CarouselController carouselController = CarouselController();

  /// Get Banners
  Future<void> getBannerFunction() async {
    isLoading(true);
    String url = "${ApiUrl.bannerApi}$zoneId";
    log("getBannerFunction url : $url");
    try {
      final response = await dioRequest.get(url);
      // log('getBannerFunction response :${jsonEncode(response.data)}');

      BannerModel bannerModel = BannerModel.fromJson(response.data);
      successStatus.value = bannerModel.success;

      if (successStatus.value) {
        bannerList.clear();
        bannerList.addAll(bannerModel.data);
        log('Banner List Length : ${bannerList.length}');
      } else {
        log("getBannerFunction Else");
      }
    } catch (e) {
      log("getBannerFunction Error $e");
      rethrow;
    }

    await getCategoryFunction();
  }

  /// Get Category
  Future<void> getCategoryFunction() async {
    isLoading(true);
    String url = ApiUrl.getCategoryApi;
    log('getCategoryFunction Api Url : $url');

    try {
      final response = await dioRequest.get(url);
      // log('getCategoryFunction response :${jsonEncode(response.data)}');

      CategoryModel categoryModel = CategoryModel.fromJson(response.data);
      successStatus.value = categoryModel.success;

      if (successStatus.value) {
        if (categoryModel.data.isNotEmpty) {
          categoryList.clear();
          categoryList.addAll(categoryModel.data);
        }
        log('categoryList Length : ${categoryList.length}');
      } else {
        log('getCategoryFunction Else');
      }
    } catch (e) {
      log('getCategoryFunction Error :$e');
      rethrow;
    }

    // isLoading(false);
    await getAllPopularRestaurantFunction();
  }

  /// Get Popular Restaurants
  Future<void> getAllPopularRestaurantFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getAllPopularRestaurantApi}$zoneId";
    log("getAllPopularRestaurantFunction Api url: $url");
    try {
      final response = await dioRequest.get(url);
      // log("getAllPopularRestaurantFunction response: ${jsonEncode(response.data)}");

      AllPopularRestaurantsModel allPopularRestaurantsModel =
          AllPopularRestaurantsModel.fromJson(response.data);
      successStatus.value = allPopularRestaurantsModel.success;

      if (successStatus.value) {
        if (allPopularRestaurantsModel.data.isNotEmpty) {
          allPopularRestaurantList.addAll(allPopularRestaurantsModel.data);
        }
        log("getAllPopularRestaurantFunction allPopularRestaurantList: $allPopularRestaurantList");
      } else {
        log("getAllPopularRestaurantFunction else");
      }
    } catch (e) {
      log("getAllPopularRestaurantFunction catch: $e");
      rethrow;
    }

    // await getTrendingFoodFunction();
    isLoading(false);
  }

  /// Get Trending Food
  Future<void> getTrendingFoodFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getTrendingFoodApi}$zoneId";
    log('getTrendingFoodFunction Api Url :$url');

    try {
      final response = await dioRequest.get(url);
      // log('getTrendingFoodFunction Response : ${jsonEncode(response.data)}');
      TrendingFoodModel trendingFoodModel =
          TrendingFoodModel.fromJson(response.data);
      successStatus.value = trendingFoodModel.success;

      if (successStatus.value) {
        if (trendingFoodModel.data.isNotEmpty) {
          trendingFoodList.clear();
          trendingFoodList.addAll(trendingFoodModel.data);
        }
        log('trendingFoodModel Length : ${trendingFoodList.length}');
      } else {
        log('getTrendingFoodFunction Else');
      }
    } catch (e) {
      log('getTrendingFoodFunction Error :$e');
      rethrow;
    }
    // isLoading(false);
    await getPopularFoodNearByYouFunction();
  }

  /// Get popular Food Near By You
  Future<void> getPopularFoodNearByYouFunction() async {
    isLoading(true);
    String url = ApiUrl.getPopularFoodNearByYouApi;
    log('getPopularFoodNearByYouFunction Api Url :$url');

    try {
      final response = await dioRequest.get(url);
      // log('getPopularFoodNearByYouFunction Response : ${jsonEncode(response.data)}');
      PopularFoodNearByModel popularFoodNearByModel =
          PopularFoodNearByModel.fromJson(response.data);
      successStatus.value = popularFoodNearByModel.success;

      if (successStatus.value) {
        if (popularFoodNearByModel.data.isNotEmpty) {
          popularFoodNearbyList.clear();
          popularFoodNearbyList.addAll(popularFoodNearByModel.data);
        }
        log('popularFoodNearbyList Length : ${popularFoodNearbyList.length}');
      } else {
        log('getPopularFoodNearByYouFunction Else');
      }
    } catch (e) {
      log('getPopularFoodNearByYouFunction Error :$e');
      rethrow;
    }
    await getNewRestaurantFunction();
  }

  /// Get New Restaurant
  Future<void> getNewRestaurantFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getNewRestaurantApi}$zoneId";
    log('getNewRestaurantFunction Api Url :$url');

    try {
      final response = await dioRequest.get(url);
      // log('getNewRestaurantFunction Response : ${jsonEncode(response.data)}');

      NewRestaurantModel newRestaurantModel =
          NewRestaurantModel.fromJson(response.data);
      successStatus.value = newRestaurantModel.success;

      if (successStatus.value) {
        if (newRestaurantModel.data.isNotEmpty) {
          newRestaurantList.clear();
          newRestaurantList.addAll(newRestaurantModel.data);
        }
        log('newRestaurantList Length : ${newRestaurantList.length}');
      } else {
        log('getNewRestaurantFunction Else');
      }
    } catch (e) {
      log('getNewRestaurantFunction Error :$e');
      rethrow;
    }
    // isLoading(false);
    await getBestReviewedFunction();
  }

  /// Get Best Reviewed Food
  Future<void> getBestReviewedFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getBestReviewedFoodApi}$zoneId";
    log('getBestReviewedFunction Api Url :$url');

    try {
      final response = await dioRequest.get(url);
      // log('getBestReviewedFunction Response : ${jsonEncode(response.data)}');

      BestReviewedFoodModel bestReviewedFoodModel =
          BestReviewedFoodModel.fromJson(response.data);
      successStatus.value = bestReviewedFoodModel.success;

      if (successStatus.value) {
        if (bestReviewedFoodModel.data.isNotEmpty) {
          bestReviewedFoodList.clear();
          bestReviewedFoodList.addAll(bestReviewedFoodModel.data);
        }
        log('bestReviewedFoodList Length : ${bestReviewedFoodList.length}');
      } else {
        log('getBestReviewedFunction Else');
      }
    } catch (e) {
      log('getBestReviewedFunction Error :$e');
      rethrow;
    }
    // isLoading(false);
    await getAllRestaurantFunction();
  }

  /// Get All Restaurant
  Future<void> getAllRestaurantFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getAllRestaurantApi}$zoneId";
    log('getAllRestaurantFunction Api Url :$url');

    try {
      final response = await dioRequest.get(url);
      // log('getAllRestaurantFunction Response : ${jsonEncode(response.data)}');

      AllRestaurantModel allRestaurantModel =
          AllRestaurantModel.fromJson(response.data);
      successStatus.value = allRestaurantModel.success;

      if (successStatus.value) {
        if (allRestaurantModel.data.isNotEmpty) {
          allRestaurantList.clear();
          allRestaurantList.addAll(allRestaurantModel.data);
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
    await getAllCuisinesFunction();
  }

  /// Get Cuisines List
  Future<void> getAllCuisinesFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllCuisinesApi;
    log('getAllCuisinesFunction Api Url :$url');

    try {
      final response = await dioRequest.get(url);
      // log('getAllCuisinesFunction Response : ${jsonEncode(response.data)}');

      CuisineModel cuisineModel = CuisineModel.fromJson(response.data);
      successStatus.value = cuisineModel.success;

      if (successStatus.value) {
        if (cuisineModel.data.isNotEmpty) {
          cuisinesList.clear();
          cuisinesList.addAll(cuisineModel.data);
        }
        log('cuisinesList Length : ${cuisinesList.length}');
      } else {
        log('getAllCuisinesFunction Else');
      }
    } catch (e) {
      log('getAllCuisinesFunction Error :$e');
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
    zoneId = await userPreference.getStringValueFromPrefs(
            key: UserPreference.userZoneIdKey) ??
        "1";
    log('Init zoneId :$zoneId');
    address.value = await userPreference.getStringFromPrefs(
        key: UserPreference.userAddressKey);
    log("address.value ${address.value}");
    await getBannerFunction();
    // await getCategoryFunction();
  }
}
