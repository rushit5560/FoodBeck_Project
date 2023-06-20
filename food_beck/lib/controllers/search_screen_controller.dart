import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import '../constants/api_url.dart';
import '../models/favorite_screen_model/add_favotite_restaurant_model.dart';
import '../models/favorite_screen_model/remove_favorite_restaurant_model.dart';
import '../models/search_screen_model/search_model.dart';
import '../utils/user_preferences.dart';

class SearchScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool successStatus = false.obs;


  List<Food> foodList = [];
  List<Restaurant> restaurantList = [];
  String userid = "";

  TextEditingController searchFieldController = TextEditingController();

  /// Search Button Click
  Future<void> searchButtonClickFunction() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (searchFieldController.text.trim().isNotEmpty) {
      await searchFunction();
    }
  }

  clearAllList() {
    FocusManager.instance.primaryFocus?.unfocus();
    foodList.clear();
    restaurantList.clear();
    loadUI();
  }


  /// Search api
  Future<void> searchFunction() async {
    isLoading(true);
    String url = "${ApiUrl.searchApi}${searchFieldController.text.trim()}";
    log('searchFunction Api Url : $url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      log('searchFunction Response :${response.body}');

      SearchModel searchModel = SearchModel.fromJson(json.decode(response.body));
      successStatus.value = searchModel.success;

      if(successStatus.value) {
        foodList.clear();
        foodList.addAll(searchModel.data.food);

        restaurantList.clear();
        restaurantList.addAll(searchModel.data.restaurant);
      } else {
        log('searchFunction Else');
      }


    } catch(e) {
      log('searchFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }


  Future<void> removeFavoriteRestaurantFunction({
    required String restaurantId,
    required Restaurant singleRestaurant,
  }) async {
    String url = "${ApiUrl.removeFavoriteRestaurantApi}$userid/$restaurantId";
    log("removeFavoriteRestaurantFunction url: $url");
    try {
      String authorizationToken = await userPreference.getAuthorizationToken(
          key: UserPreference.userTokenKey);

      String finalToken = "Bearer $authorizationToken";

      http.Response response = await http.get(Uri.parse(url), headers: {
        "Accept": "application/json",
        "Authorization": finalToken,
      });

      log("removeFavoriteRestaurantFunction response :  ${response.body}");

      RemoveFavoriteRestaurantModel removeFavoriteRestaurantModel =
      RemoveFavoriteRestaurantModel.fromJson(json.decode(response.body));

      successStatus.value = removeFavoriteRestaurantModel.success;
      if (successStatus.value) {
        Fluttertoast.showToast(msg: removeFavoriteRestaurantModel.message);
        singleRestaurant.isFav = false;
      } else {
        Fluttertoast.showToast(msg: removeFavoriteRestaurantModel.message);
      }
    } catch (e) {
      log("removeFavoriteRestaurantFunction catch: $e");
      rethrow;
    }
    isLoading(true);
    isLoading(false);
  }

  Future<void> addFavoriteRestaurantFunction({
    required String restaurantId,
    required Restaurant singleRestaurant,
  }) async {
    String url = "${ApiUrl.addFavoriteRestaurantApi}$userid/$restaurantId";
    log("addFavoriteRestaurantFunction url: $url");
    try {
      String authorizationToken = await userPreference.getAuthorizationToken(
          key: UserPreference.userTokenKey);

      String finalToken = "Bearer $authorizationToken";
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": finalToken,
        },
      );

      log('addFavoriteRestaurantFunction response : ${response.body}');
      AddFavoriterestaurantModel addFavoriteRestaurantModel =
      AddFavoriterestaurantModel.fromJson(json.decode(response.body));

      successStatus.value = addFavoriteRestaurantModel.success;
      if (successStatus.value) {
        Fluttertoast.showToast(msg: addFavoriteRestaurantModel.message);
        singleRestaurant.isFav = true;
      } else {
        Fluttertoast.showToast(msg: addFavoriteRestaurantModel.message);
      }
    } catch (e) {
      log("addFavoriteRestaurantFunction catch: $e");
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
    userid = await userPreference.getStringValueFromPrefs(
        key: UserPreference.userIdKey) ??
        "";
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

}
