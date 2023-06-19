import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../constants/api_url.dart';
import '../utils/user_preferences.dart';

class FavoritesScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool successStatus = false.obs;

  String userId = "";
  UserPreference userPreference = UserPreference();

  List favouriteFoodList = [1,2,3,4,5,6,7,8,9,0];
  List favouriteRestaurantList = [1,2,3,4,5,6,7,8,9,0];



  /// Get Favourite Food & Restaurant
  Future<void> getFavouriteFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getFavouriteApi}$userId";
    log('getFavouriteFunction Api Url :$url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      log('getFavouriteFunction Response :${response.body}');



    } catch(e) {
      log('getFavouriteFunction Error :$e');
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
    userId = await userPreference.getStringValueFromPrefs(key: UserPreference.userIdKey) ?? "";
    // await getFavouriteFunction();
  }

 
}
