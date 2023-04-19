
class ApiUrl {
  static String databaseUrl = "http://food.omdemo.co.in/";
  static String baseUrl = "${databaseUrl}api";


  // Authentication
  static String registerApi = "$baseUrl/register";
  static String loginApi = "$baseUrl/login";

  static String bannerApi = "$baseUrl/banner/";

  static String cmsApi = "$baseUrl/cms/";
  static String allProductsApi = "$baseUrl/allproducts/";
  static String filterByCategoryApi = "$baseUrl/filterbycategory/";
  static String cartApi = "$baseUrl/cart/";
  static String updateCartApi = "$baseUrl/updatecart";
  static String zoneApi = "$baseUrl/zone";
}