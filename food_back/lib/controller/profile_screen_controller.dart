import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_back/utils/user_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constance/api_url.dart';
import '../constance/app_images.dart';
import '../model/profile_screen_model/get_profile_model.dart';
import '../model/profile_screen_model/main_category_model.dart';
import '../screens/authentication_screen/sign_in_screen/sign_in_screen.dart';
// import '../screens/terms_conditins_screen/terms_conditins_screen.dart';

class ProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxString userId = "".obs;
  RxString userName = "".obs;
  RxString userEmail = "".obs;
  RxString userPhone = "".obs;
  RxString userImage = "".obs;
  String authorizationToken = "";
  RxBool successStatus = false.obs;

  UserPreference userPreference = UserPreference();

  List<ProfileCategory> selectList = [
    ProfileCategory(image: AppImages.i4, name: "Terms & Conditions"),
  ];

  @override
  void onInit() async {
    log("11");
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    log("111");
    userId.value = await userPreference.getUserLoggedInFromPrefs(
        key: UserPreference.userIdKey);
    log("getUserLoggedInFromPrefs userid $userId");
    authorizationToken = await userPreference.getAuthorizationToken(
        key: UserPreference.userTokenKey);
  }

  Future<void> getMyProfileDataValueFromPrefs() async {
    userName.value = await userPreference.getStringFromPrefs(
        key: UserPreference.userNameKey);
    userEmail.value = await userPreference.getStringFromPrefs(
        key: UserPreference.userEmailKey);
    userPhone.value = await userPreference.getStringFromPrefs(
        key: UserPreference.userPhoneKey);
    userImage.value = await userPreference.getStringFromPrefs(
        key: UserPreference.userImageKey);

    loadUI();
  }

  logOutButtonFunction() async {
    await userPreference.removeuserDetails();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
