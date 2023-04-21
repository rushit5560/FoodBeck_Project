class ApiUrl {
  static String databaseUrl = "http://food.omdemo.co.in/";
  static String baseUrl = "${databaseUrl}api";
  static String bannerImagePathUrl =
      "${databaseUrl}public/assests/banner/compress_img";
  static String allProductImagePathUrl = "${databaseUrl}public/assests/food";
  static String categoryImagePathUrl = "${databaseUrl}public/assests/category/";
  static String getCategoryApi = "$baseUrl/get-categorys";
  static String getrRestaurantImagePathUrl = "${databaseUrl}public/assests/restaurant";

  // Authentication
  static String registerApi = "$baseUrl/register";
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
  static String allProductsApi = "$baseUrl/all-products/";
  static String filterByCategoryApi = "$baseUrl/filter-by-category/";
  static String getAllPopularRestaurant = "$baseUrl/popular-restaurant/";
}
