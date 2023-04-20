import 'dart:developer';
import 'package:food_back/utils/user_preferences.dart';
import 'package:get/get.dart';

import '../constance/app_images.dart';
import '../model/profile_screen_model/main_category_model.dart';
// import '../screens/terms_conditins_screen/terms_conditins_screen.dart';

class ProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxString userId = "".obs;

  RxString userName = "".obs;
  RxString userEmail = "".obs;
  RxString userPhone = "".obs;
  RxString userImage = "".obs;

  UserPreference userPreference = UserPreference();

  List<ProfileCategory> selectList = [
    ProfileCategory(image: AppImages.i4, name: "Terms & Conditions"),
  ];

  void optionProfileClickFunction(int index) {
    // if (index == 0) {
    //   Get.to(
    //         () => TermsAndConditionsScreen(),
    //   );
    // }
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    await getUserDetailsFromPrefsFunction();
  }

  Future<void> getUserDetailsFromPrefsFunction() async {
    isLoading(true);
    userId.value = await userPreference.getStringValueFromPrefs(
            key: UserPreference.userIdKey) ??
        "";
    log(" userId.value ${userId.value}");
    userName.value = await userPreference.getStringValueFromPrefs(
            key: UserPreference.userNameKey) ??
        "";
    userEmail.value = await userPreference.getStringValueFromPrefs(
            key: UserPreference.userEmailKey) ??
        "";
    userPhone.value = await userPreference.getStringValueFromPrefs(
            key: UserPreference.userPhoneKey) ??
        "";
    userImage.value = await userPreference.getStringValueFromPrefs(
            key: UserPreference.userImageKey) ??
        "";
    isLoading(false);
  }
}
