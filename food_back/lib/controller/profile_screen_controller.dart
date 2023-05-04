import 'dart:developer';
import 'package:food_back/utils/user_preferences.dart';
import 'package:get/get.dart';
import '../constance/app_images.dart';
import '../model/profile_screen_model/main_category_model.dart';

class ProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxString userId = "".obs;
  RxString userName = "".obs;
  RxString userEmail = "".obs;
  RxString userPhone = "".obs;
  RxString userImage = "".obs;
  RxString userZoneID = "".obs;

  String authorizationToken = "";
  RxBool successStatus = false.obs;

  UserPreference userPreference = UserPreference();

  List<ProfileCategory> selectList = [
    ProfileCategory(image: AppImages.i4, name: "Terms & Conditions"),
  ];

  @override
  void onInit() async {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    userId.value = await userPreference.getUserLoggedInFromPrefs(
        key: UserPreference.userIdKey);
    log("getUserLoggedInFromPrefs userid $userId");
    authorizationToken = await userPreference.getAuthorizationToken(
        key: UserPreference.userTokenKey);
    await getMyProfileDataValueFromPrefs();
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
    userZoneID.value = await userPreference.getStringFromPrefs(
        key: UserPreference.userZoneIdKey);

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
