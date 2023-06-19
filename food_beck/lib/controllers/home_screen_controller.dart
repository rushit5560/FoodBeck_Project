import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../constants/api_url.dart';
import '../models/home_screen_model/all_restaurant_model.dart';
import '../models/home_screen_model/best_reviewed_food_model.dart';
import '../models/home_screen_model/category_model.dart';
import '../models/home_screen_model/cuisine_model.dart';
import '../models/home_screen_model/food_details_model.dart';
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
  List<TrendingFood> trendingFoodList = [];
  List<PopularFoodData> popularFoodNearbyList = [];
  List<NewRestaurantData> newRestaurantList = [];
  List<BestReviewedFood> bestReviewedFoodList = [];
  List<RestaurantDetails> allRestaurantList = [];
  List<CuisineDetails> cuisinesList = [];

  FoodData selectedFoodData = FoodData();


  RxInt currentIndex = 0.obs;
  TextEditingController searchbarController = TextEditingController();
  final CarouselController carouselController = CarouselController();

  /// Get Banners
  Future<void> getBannerFunction() async {
    isLoading(true);
    String url = "${ApiUrl.bannerApi}$zoneId";
    log("getBannerFunction url : $url");
    try {
      http.Response response = await http.get(Uri.parse(url));
      log('getBannerFunction response :${response.body}');
      BannerModel cmsPageModel =
          BannerModel.fromJson(json.decode(response.body));
      successStatus.value = cmsPageModel.success;
      if (successStatus.value) {
        bannerList.addAll(cmsPageModel.data);
        log('Banner List Length : ${bannerList.length}');
      } else {
        log("getBannerFunction Error");
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
      http.Response response = await http.get(Uri.parse(url));
      CategoryModel categoryModel =
          CategoryModel.fromJson(json.decode(response.body));
      successStatus.value = categoryModel.success;

      if (successStatus.value) {
        categoryList.clear();
        categoryList.addAll(categoryModel.data);
        log('categoryList Length : ${categoryList.length}');
      } else {
        log('getCategoryFunction');
      }
    } catch (e) {
      log('getCategoryFunction Error :$e');
      rethrow;
    }
    isLoading(false);

    // await getAllPopularRestaurantFunction();
  }

  /// Get Popular Restaurants
  Future<void> getAllPopularRestaurantFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getAllPopularRestaurantApi}$zoneId";
    log("getAllPopularRestaurantFunctionurl: $url");
    try {
      http.Response response = await http.get(Uri.parse(url));
      // log("getAllPopularRestaurantFunction response: ${response.body}");
      AllPopularRestaurantsModel allPopularRestaurantsModel =
          AllPopularRestaurantsModel.fromJson(json.decode(response.body));
      successStatus.value = allPopularRestaurantsModel.success;
      if (successStatus.value) {
        allPopularRestaurantList.addAll(allPopularRestaurantsModel.data);
        log("getAllPopularRestaurantFunction allPopularRestaurantList: $allPopularRestaurantList");
      } else {
        log("else else");
      }
    } catch (e) {
      log("getAllPopularRestaurantFunction catch: $e");
      rethrow;
    }
    await getTrendingFoodFunction();
  }

  /// Get Trending Food
  Future<void> getTrendingFoodFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getTrendingFoodApi}$zoneId";
    log('getTrendingFoodFunction Api Url :$url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      // log('getTrendingFoodFunction Response : ${response.body}');

      TrendingFoodModel trendingFoodModel = TrendingFoodModel.fromJson(json.decode(response.body));
      successStatus.value = trendingFoodModel.success;

      if(successStatus.value) {
        trendingFoodList.clear();
        trendingFoodList.addAll(trendingFoodModel.data);
        log('trendingFoodModel Length : ${trendingFoodList.length}');
      } else {
        log('getTrendingFoodFunction Else');
      }

    } catch(e) {
      log('getTrendingFoodFunction Error :$e');
      rethrow;
    }
    await getPopularFoodNearByYouFunction();
  }

  /// Get popular Food Near By You
  Future<void> getPopularFoodNearByYouFunction() async {
    isLoading(true);
    String url = ApiUrl.getPopularFoodNearByYouApi;
    log('getPopularFoodNearByYouFunction Api Url :$url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      // log('getPopularFoodNearByYouFunction Response : ${response.body}');

      PopularFoodNearByModel popularFoodNearByModel = PopularFoodNearByModel.fromJson(json.decode(response.body));
      successStatus.value = popularFoodNearByModel.success;

      if(successStatus.value) {
        popularFoodNearbyList.clear();
        popularFoodNearbyList.addAll(popularFoodNearByModel.data);
        log('popularFoodNearbyList Length : ${popularFoodNearbyList.length}');
      } else {
        log('getPopularFoodNearByYouFunction Else');
      }

    } catch(e) {
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
      http.Response response = await http.get(Uri.parse(url));
      // log('getNewRestaurantFunction Response : ${response.body}');

      NewRestaurantModel newRestaurantModel = NewRestaurantModel.fromJson(json.decode(response.body));
      successStatus.value = newRestaurantModel.success;

      if(successStatus.value) {
        newRestaurantList.clear();
        newRestaurantList.addAll(newRestaurantModel.data);
        log('newRestaurantList Length : ${newRestaurantList.length}');
      } else {
        log('getNewRestaurantFunction Else');
      }

    } catch(e) {
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
      http.Response response = await http.get(Uri.parse(url));
      // log('getBestReviewedFunction Response : ${response.body}');

      BestReviewedFoodModel bestReviewedFoodModel = BestReviewedFoodModel.fromJson(json.decode(response.body));
      successStatus.value = bestReviewedFoodModel.success;

      if(successStatus.value) {
        bestReviewedFoodList.clear();
        bestReviewedFoodList.addAll(bestReviewedFoodModel.data);
        log('bestReviewedFoodList Length : ${bestReviewedFoodList.length}');
      } else {
        log('getBestReviewedFunction Else');
      }

    } catch(e) {
      log('getBestReviewedFunction Error :$e');
      rethrow;
    }
    // isLoading(false);
    await getAllRestaurantFunction();
  }

  /// Get Best Reviewed Food
  Future<void> getAllRestaurantFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getAllRestaurantApi}$zoneId";
    log('getAllRestaurantFunction Api Url :$url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      // log('getAllRestaurantFunction Response : ${response.body}');

      AllRestaurantModel allRestaurantModel = AllRestaurantModel.fromJson(json.decode(response.body));
      successStatus.value = allRestaurantModel.success;

      if(successStatus.value) {
        allRestaurantList.clear();
        allRestaurantList.addAll(allRestaurantModel.data);
        log('allRestaurantList Length : ${allRestaurantList.length}');
      } else {
        log('getAllRestaurantFunction Else');
      }

    } catch(e) {
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
      http.Response response =await http.get(Uri.parse(url));
      // log('getAllCuisinesFunction Response : ${response.body}');

      CuisineModel cuisineModel = CuisineModel.fromJson(json.decode(response.body));
      successStatus.value = cuisineModel.success;

      if(successStatus.value) {
        cuisinesList.clear();
        cuisinesList.addAll(cuisineModel.data);
        log('cuisinesList Length : ${cuisinesList.length}');
      } else {
       log('getAllCuisinesFunction Else');
      }

    } catch(e) {
      log('getAllCuisinesFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }


  /// Get Food Details - Click on Food
  Future<void> getFoodDetailsFunction(String foodId) async {
    isFoodDetailsLoading(true);
    String url = "${ApiUrl.getFoodDetailsApi}$foodId";
    log('getFoodDetailsFunction Api Url : $url');

    try {
      Map<String, String> header = await ApiHeader().getHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);
      // log('getFoodDetailsFunction Response :${response.body}');

      FoodDetailsModel foodDetailsModel = FoodDetailsModel.fromJson(json.decode(response.body));
      isFoodDetailsSuccessStatus.value = foodDetailsModel.success;

      if(isFoodDetailsSuccessStatus.value) {
        selectedFoodData = foodDetailsModel.data[0];
        // FoodDetailsBottomSheetModule().foodDetailsBottomSheet(foodData: selectedFoodData);
      } else {
        log('getFoodDetailsFunction Else');
      }

    } catch(e) {
      log('getFoodDetailsFunction Error :$e');
      rethrow;
    }
    isFoodDetailsLoading(false);
  }


  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    zoneId = await userPreference.getStringValueFromPrefs(key: UserPreference.userZoneIdKey) ?? "";
    await getBannerFunction();
    // await getAllPopularRestaurantFunction();
  }
}
