import 'dart:convert';
import 'dart:developer';
import 'package:food_back/utils/user_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constance/api_url.dart';
import '../constance/app_images.dart';
import '../model/profile_screen_model/get_profile_model.dart';
import '../model/profile_screen_model/main_category_model.dart';
// import '../screens/terms_conditins_screen/terms_conditins_screen.dart';

class ProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  String userId = "";

  String userName = "";
  String userEmail = "";
  String userPhone = "";
  String userImage = "";
  String authorizationToken = "";
  RxBool successStatus = false.obs;

  UserPreference userPreference = UserPreference();

  List<ProfileCategory> selectList = [
    ProfileCategory(image: AppImages.i4, name: "Terms & Conditions"),
  ];

  // void optionProfileClickFunction(int index) {
  //   // if (index == 0) {
  //   //   Get.to(
  //   //         () => TermsAndConditionsScreen(),
  //   //   );
  //   // }
  // }

  getUserAccount() async {
    isLoading(true);
    String url = "${ApiUrl.getProfileApi}$userId";
    log("getUserAccount Api Url : $url");

    try {
      Map<String, String> headers = <String, String>{
        'Accept': "application/json",
        'Authorization': "Bearer $authorizationToken",
      };
      log("authorizationToken $authorizationToken");
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      log("getUserProfileFunction response :  ${response.body}");
      GetProfileModel getProfileModel =
          GetProfileModel.fromJson(json.decode(response.body));

      successStatus.value = getProfileModel.success;

      log("successStatus.value ${successStatus.value}");
      if (successStatus.value) {
        userName = getProfileModel.data.name;
        userEmail = getProfileModel.data.email;
        userPhone = getProfileModel.data.phoneno;
        userImage = "${ApiUrl.profileImage}${getProfileModel.data.image}";
        log("userName $userName");
        userPreference.setUserProfilePrefs(
          userName: getProfileModel.data.name,
          userProfile: "${ApiUrl.profileImage}${getProfileModel.data.image}",
          userEmail: getProfileModel.data.email,
          userPhoneNo: getProfileModel.data.phoneno,
        );
      }
    } catch (e) {
      log("getUserAccount error $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() async {
    log("11");
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    log("111");
    userId = await userPreference.getUserLoggedInFromPrefs(
        key: UserPreference.userIdKey);
    log("getUserLoggedInFromPrefs userid $userId");
    authorizationToken = await userPreference.getAuthorizationToken(
        key: UserPreference.userTokenKey);
    await getUserAccount();
  }

  // Future<void> getUserDetailsFromPrefsFunction() async {
  //   isLoading(true);
  //   userId.value = await userPreference.getStringValueFromPrefs(
  //           key: UserPreference.userIdKey) ??
  //       "";
  //   log(" userId.value ${userId.value}");
  //   userName.value = await userPreference.getStringValueFromPrefs(
  //           key: UserPreference.userNameKey) ??
  //       "";
  //   userEmail.value = await userPreference.getStringValueFromPrefs(
  //           key: UserPreference.userEmailKey) ??
  //       "";
  //   userPhone.value = await userPreference.getStringValueFromPrefs(
  //           key: UserPreference.userPhoneKey) ??
  //       "";
  //   userImage.value = await userPreference.getStringValueFromPrefs(
  //           key: UserPreference.userImageKey) ??
  //       "";
  //   isLoading(false);
  // }
}
