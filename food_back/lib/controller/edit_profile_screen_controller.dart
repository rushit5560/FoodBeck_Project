import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_back/constance/api_url.dart';
import 'package:food_back/model/profile_screen_model/get_profile_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/user_preferences.dart';

class EditProfileScreenController extends GetxController {
  // RxString userId = Get.arguments;

  RxBool isLoading = false.obs;

  RxBool successStatus = false.obs;
  // ApiHeader apiHeader = ApiHeader();

  String userId = "";
  String authorizationToken = "";
  UserPreference userPreference = UserPreference();
  GlobalKey<FormState> updateProfileKey = GlobalKey<FormState>();
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController phoneNoFieldController = TextEditingController();

  /// Get Profile Function
  Future<void> getUserProfileFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getProfileApi}$userId";
    log("getUserProfileFunction Api Url : $url");

    try {
      Map<String, String> headers = <String, String>{
        'Accept': "application/json",
        'Authorization': "Bearer $authorizationToken",
      };
      log("authorizationToken $authorizationToken");
      http.Response response = await http.get(Uri.parse(url), headers: headers);

      log("getUserProfileFunction response :  ${response.body}");
      // log("getUserProfileFunction headers $headers");

      GetProfileModel getProfileModel =
          GetProfileModel.fromJson(json.decode(response.body));

      successStatus.value = getProfileModel.success;
      log("successStatus.value ${successStatus.value}");
      if (successStatus.value) {
        nameFieldController.text = getProfileModel.data.name;
        emailFieldController.text = getProfileModel.data.email;
        phoneNoFieldController.text = getProfileModel.data.phoneno;
      } else {
        log("getUserProfileFunction else else");
      }
    } catch (e) {
      log("getUserProfileFunction error: $e");
      rethrow;
    }
    isLoading(false);
  }

  Future<void> initMethod() async {
    userId = await userPreference.getUserLoggedInFromPrefs(
        key: UserPreference.userIdKey);
    log("getUserLoggedInFromPrefs userid $userId");
    authorizationToken = await userPreference.getAuthorizationToken(
        key: UserPreference.userTokenKey);
    // log("getUserLoggedInFromPrefs authorizationToken $authorizationToken");

    await getUserProfileFunction();
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
}


//  updateProfileDataFunction() async {
//     isLoading(true);

//     String url = ApiUrl.upDateProfileApi;
//     log("updateProfileDataFunction url: $url");
//     try {
//       var request = http.MultipartRequest('POST', Uri.parse(url));

//       request.fields['UserID'] = userId;
//       request.fields['FirstName'] = firstnamecontroller.text;
//       // request.fields['EmailId'] = emailcontroller.text;
//       request.fields['LastName'] = lastNameController.text;
//       request.fields['MobileNo'] = mobileNocontroller.text;
//       request.fields['StreetAddress'] = streetAddresscontroller.text;
//       request.fields['UserName'] = usernamecontroller.text;
//       request.fields['City'] = citycontroller.text;
//       request.fields['State'] = statecontroller.text;
//       request.fields['PostalCode'] = zipcontroller.text;
//       request.fields['Country'] = countrycontroller.text;
//       log('updateProfileDataFunction request.fields: ${request.fields}');
//       var response = await request.send();

//       response.stream
//           .transform(const Utf8Decoder())
//           .transform(const LineSplitter())
//           .listen((value) async {
//         UpdateProfileMOdel updateProfileMOdel =
//             UpdateProfileMOdel.fromJson(json.decode(value));
//         log('response body is ::: $value');

//         if (successStatus.value.toLowerCase() == "ok") {
//           Fluttertoast.showToast(
//             msg: updateProfileMOdel.message,
//             toastLength: Toast.LENGTH_SHORT,
//           );
//           log(updateProfileMOdel.message);
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           UserDetails.email =
//               prefs.getString(UserPreference.userEmailKey) ?? "";
//           UserDetails.userFNameKey =
//               prefs.getString(UserPreference.userFNameKey) ?? "";
//           UserDetails.userLNameKey =
//               prefs.getString(UserPreference.userLNameKey) ?? "";
//           UserDetails.username =
//               prefs.getString(UserPreference.userNameKey) ?? "";
//           UserDetails.password =
//               prefs.getString(UserPreference.userPasswordKey) ?? "";
//           UserDetails.fullName =
//               prefs.getString(UserPreference.fullNameKey) ?? "";
//           UserDetails.phoneNumber =
//               prefs.getString(UserPreference.phoneNumberKey) ?? "";
//           UserDetails.state = prefs.getString(UserPreference.stateKey) ?? "";
//           UserDetails.country =
//               prefs.getString(UserPreference.countryKey) ?? "";
//           UserDetails.city = prefs.getString(UserPreference.cityKey) ?? "";
//           UserDetails.zipCode =
//               prefs.getString(UserPreference.zipCodeKey) ?? "";
//           Get.back();
//         } else {
//           log("false false");
//         }
//       });
//     } catch (e) {
//       log("updateProfileDataFunction error :$e");
//       rethrow;
//     } finally {
//       isLoading(false);
//     }
//   }