import 'dart:developer';

import '../utils/user_preferences.dart';

class ApiUrl {
  static String databaseUrl = "http://food.omdemo.co.in/";
  static String baseUrl = "${databaseUrl}api";

  // Images url - Dont touch
  static String bannerImagePathUrl =
      "${databaseUrl}public/assests/banner/compress_img";
  static String foodImagePathUrl = "${databaseUrl}public/assests/food";
  static String categoryImagePathUrl = "${databaseUrl}public/assests/category/";
  static String restaurantImagePathUrl =
      "${databaseUrl}public/assests/restaurant/";
// http://food.omdemo.co.in/public/assests/restaurant/logo.png
  // Authentication
  static String registerApi = "$baseUrl/register_user";
  static String loginApi = "$baseUrl/login";
  static String profileApi = "$baseUrl/profile/";

  static String cmsApi = "$baseUrl/cms/";

  static String cartApi = "$baseUrl/cart/";
  static String updateCartApi = "$baseUrl/updatecart";
  static String zoneApi = "$baseUrl/zone";
  static String getProfileApi = "$baseUrl/profile/";
  static String updateProfileApi = "$baseUrl/update-profile/";
//home page api's
  static String bannerApi = "$baseUrl/banner/";
  static String getCategoryApi = "$baseUrl/get-categorys";
  static String allProductsApi = "$baseUrl/all-products/";
  static String filterByCategoryApi = "$baseUrl/filter-by-category/";
  static String getAllPopularRestaurantApi = "$baseUrl/popular-restaurant/";
  static String getPRestaurantDetailsApi = "$baseUrl/restaurant-detail/";

  static String getTrendingFoodApi = "$baseUrl/tranding-food/";
  static String getPopularFoodNearByYouApi = "$baseUrl/popular-food-nearby";
  static String getNewRestaurantApi = "$baseUrl/new-restaurant/";
  static String getBestReviewedFoodApi = "$baseUrl/best-reviewed-food/";
  static String getAllRestaurantApi = "$baseUrl/restaurants/";
  static String getCategoryWiseRestaurantsApi = "$baseUrl/filter-by-category/";
}

UserPreference userPreference = UserPreference();

class ApiHeader {
  Future<Map<String, String>> getHeader() async {
    String authorizationToken = await userPreference.getAuthorizationToken(
        key: UserPreference.userTokenKey);

    Map<String, String> headers = <String, String>{
      'Accept': "application/json",
      'Authorization': "Bearer $authorizationToken",
    };

    return headers;
  }
}
