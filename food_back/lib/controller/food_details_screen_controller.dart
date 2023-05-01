import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constance/api_url.dart';
import '../model/home_screen_model/food_details_model.dart';

class FoodDetailsScreenController extends GetxController {
  String foodId = Get.arguments[0] ?? "0";

  RxBool isLoading = false.obs;
  RxBool successStatus = false.obs;

  // RxString foodName = "".obs;

  FoodData selectedFoodData = FoodData();
  String imageUrl = "";
  RxInt qty = 1.obs;
  double foodPrice = 0.0;
  RxDouble finalFoodAmount = 0.0.obs;

  /// Get Food Details - Click on Food
  Future<void> getFoodDetailsFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getFoodDetailsApi}$foodId";
    log('getFoodDetailsFunction Api Url : $url');

    try {
      Map<String, String> header = await ApiHeader().getHeader();
      http.Response response = await http.get(Uri.parse(url), headers: header);
      log('getFoodDetailsFunction Response :${response.body}');

      FoodDetailsModel foodDetailsModel = FoodDetailsModel.fromJson(json.decode(response.body));
      successStatus.value = foodDetailsModel.success;

      if(successStatus.value) {
        selectedFoodData = foodDetailsModel.data[0];
        imageUrl = ApiUrl.foodImagePathUrl + selectedFoodData.image!;
        foodPrice = double.parse(selectedFoodData.price!);
        finalFoodAmount.value = foodPrice * qty.value;
        // FoodDetailsBottomSheetModule().foodDetailsBottomSheet(foodData: selectedFoodData);
      } else {
        log('getFoodDetailsFunction Else');
      }

    } catch(e) {
      log('getFoodDetailsFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }

  foodQtyDecrease() {
    if(qty.value < 2) {
      log('Nothing Happens');
    } else {
      qty.value--;
      finalFoodAmount.value = foodPrice * qty.value;
    }
    loadUI();
  }

  foodQtyIncrease() {
    if(qty.value > 9) {
      log('Nothing Happens');
    } else {
      qty.value++;
      finalFoodAmount.value = foodPrice * qty.value;
    }
    loadUI();
  }


  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    await getFoodDetailsFunction();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}