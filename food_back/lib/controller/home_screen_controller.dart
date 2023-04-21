import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_back/model/home_screen_model/popular_restaurants_model.dart';
import 'package:food_back/utils/user_preferences.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../constance/api_url.dart';
import '../model/home_screen_model/category_model.dart';
import '../model/home_screen_model/trending_food_model.dart';
import '../model/recipes_screen_model/all_products_model.dart';
import '../model/recipes_screen_model/banner_model.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool successStatus = false.obs;
  String zoneId = "";

  UserPreference userPreference = UserPreference();

  RxBool isLiked = false.obs;
  List<BannerList> bannerList = [];
  List<CategoryData> categoryList = [];
  List<TakeYourPickProduct> allProductsList = [];
  List<RestaurantData> allPopularRestaurantList = [];
  List<TrendingFood> trendingFoodList = [];


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
      // log('getBannerFunction response :${response.body}');
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
    await getAllPopularRestaurantFunction();
  }

  /// Get Popular Restaurants
  Future<void> getAllPopularRestaurantFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getAllPopularRestaurantApi}$zoneId";
    log("getAllPopularRestaurantFunctionurl: $url");
    try {
      http.Response response = await http.get(Uri.parse(url));
      log("getAllPopularRestaurantFunction response: ${response.body}");
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
      log('getTrendingFoodFunction Response : ${response.body}');

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
    isLoading(false);
  }



  /// Get All Products
  /*Future<void> getAllProductFunction() async {
    isLoading(true);
    String url = "${ApiUrl.allProductsApi}1";
    log("getAllProductFunction url : $url");
    try {
      http.Response response = await http.get(Uri.parse(url));
      // log('getTakeYourPickProductFunction response :${response.body}');
      AllProductsModel allProductsModel =
          AllProductsModel.fromJson(json.decode(response.body));
      successStatus.value = allProductsModel.success;
      if (successStatus.value) {
        allProductsList.addAll(allProductsModel.data);
        log('allProductsList Length : ${allProductsList.length}');
      } else {
        log("getAllProductFunction Else");
      }
    } catch (e) {
      log("getAllProductFunction Error $e");
      rethrow;
    }
    isLoading(false);
  }*/

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
