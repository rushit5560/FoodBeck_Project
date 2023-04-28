import 'package:get/get.dart';

import '../utils/user_preferences.dart';

class AddAddressScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  String userId = "";

  UserPreference userPreference = UserPreference();

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    userId = await userPreference.getStringValueFromPrefs(key: UserPreference.userIdKey) ?? "";
  }
}