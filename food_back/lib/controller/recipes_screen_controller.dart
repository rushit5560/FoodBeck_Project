import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../constance/api_url.dart';
import '../model/recipes_screen_model/all_products_model.dart';
import '../model/recipes_screen_model/banner_model.dart';

class RecipesScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool successStatus = false.obs;
  List<BannerList> bannerList = [];
  List<TakeYourPickProduct> takeYourPickProductList = [];
  RxInt currentIndex = 0.obs;
  TextEditingController searchbarController = TextEditingController();
  final CarouselController carouselController = CarouselController();
  Future<void> getBannerFunction() async {
    isLoading(true);
    String url = "${ApiUrl.bannerApi}1";
    log("getBannerFunction url : $url");
    try {
      http.Response response = await http.get(Uri.parse(url));
      log('getBannerFunction response :${response.body}');
      BannerModel cmsPageModel = BannerModel.fromJson(json.decode(response.body));
       successStatus.value = cmsPageModel.success;
      if (successStatus.value) {
        bannerList.addAll(cmsPageModel.data);
        log("{banner images ${ApiUrl.bannerImagePathUrl + cmsPageModel.data[0].image}");
       log("getBannerFunction bannerList$bannerList");
      } else {
        log("getBannerFunction Error");
      }
    } catch (e) {
      log("getBannerFunction Error $e");
      rethrow;
    }
    await getTakeYourPickProductFunction();
  }

  Future<void> getTakeYourPickProductFunction() async {
    isLoading(true);
    String url = "${ApiUrl.allProductsApi}1";
    log("getTakeYourPickProductFunction url : $url");
    try {
      http.Response response = await http.get(Uri.parse(url));
      log('getTakeYourPickProductFunction response :${response.body}');
      TakeYourPickProductModel takeYourPickProductModel = TakeYourPickProductModel.fromJson(json.decode(response.body));
      successStatus.value = takeYourPickProductModel.success;
      if (successStatus.value) {
        takeYourPickProductList.addAll(takeYourPickProductModel.data);
        log("{banner images ${ApiUrl.allProductImagePathUrl + takeYourPickProductModel.data[0].image}");
        log("getTakeYourPickProductFunction takeYourPickProductList$takeYourPickProductList");
      } else {
        log("getTakeYourPickProductFunction Error");
      }
    } catch (e) {
      log("getBannerFunction Error $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }
  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  initMethod() async {
    await getBannerFunction();
    //await getTakeYourPickProductFunction();
  }
}