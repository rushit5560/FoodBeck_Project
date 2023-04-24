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
  String image = '';
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
        image = ApiUrl.restaurantImagePathUrl +
            getRestaurantDetailsModel.data[0].logo;
        log("image 11 $image");
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
