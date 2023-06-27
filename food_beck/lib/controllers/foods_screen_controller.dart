import 'dart:convert';
import 'dart:developer';
import 'package:food_beck/models/common_models/food_data_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../constants/api_url.dart';
import '../constants/enums.dart';
import '../models/foods_screen_model/all_foods_model.dart';
import '../utils/user_preferences.dart';

class FoodsScreenController extends GetxController {
  String headerName = Get.arguments[0];
  FoodsComingFrom foodsComingFrom = Get.arguments[1];

  RxBool isLoading = false.obs;
  RxBool successStatus = false.obs;
  final dioRequest = dio.Dio();


  List<FoodData> allFoodsList = [];
  List<FoodData> vegFoodsList = [];
  List<FoodData> nonVegFoodsList = [];

  UserPreference userPreference = UserPreference();
  String zoneId = "";
  String userId = "";


  Future<void> getFoodsFunction() async {
    isLoading(true);
    String url = getFoodsApiUrl();
    log('getFoodsFunction Api Url : $url');

    try {
      final response = await dioRequest.get(url);
      log('getFoodsFunction Response : ${jsonEncode(response.data)}');

      AllFoodModel allFoodModel = AllFoodModel.fromJson(response.data);
      successStatus.value = allFoodModel.success;

      if(successStatus.value) {
        if(allFoodModel.data.isNotEmpty) {
          allFoodsList.clear();
          allFoodsList.addAll(allFoodModel.data);

          for(var element in allFoodsList) {
            if(element.veg == "1") {
              vegFoodsList.add(element);
            } else {
              nonVegFoodsList.add(element);
            }
          }
        }
      } else {
        log('getFoodsFunction Else');
      }

    } catch(e) {
      log('getFoodsFunction Error :$e');
    }

    isLoading(false);
  }


  String getFoodsApiUrl() {
    String url = foodsComingFrom == FoodsComingFrom.bestReviewedFood
        ? "${ApiUrl.getBestReviewedFoodApi}$zoneId"
        : "";

    return url;
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    zoneId = await userPreference.getStringValueFromPrefs(key: UserPreference.userZoneIdKey) ?? "1";
    userId = await userPreference.getStringValueFromPrefs(key: UserPreference.userIdKey) ?? "";
    await getFoodsFunction();
  }
}