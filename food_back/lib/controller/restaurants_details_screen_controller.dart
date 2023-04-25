import 'dart:convert';
import 'dart:developer';
import 'package:food_back/model/restaurants_details_screen_model/restaurants_details_model.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

import '../constance/api_url.dart';

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
    isLoading(false);
  }

  @override
  void onInit() {
    getRestaurantsDetailsFunction();
    super.onInit();
  }
}
