import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_back/constance/api_url.dart';
import 'package:food_back/constance/color.dart';
import 'package:food_back/model/profile_screen_model/get_profile_model.dart';
import 'package:food_back/model/sign_up_model/zone_model.dart';
import 'package:food_back/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/profile_screen_model/update_profile_model.dart';
import '../utils/userDetails.dart';
import '../utils/user_preferences.dart';

class EditProfileScreenController extends GetxController {
  // RxString userId = Get.arguments;

  RxBool isLoading = false.obs;

  RxBool successStatus = false.obs;
  // ApiHeader apiHeader = ApiHeader();
  RxBool isSuccessStatus = false.obs;
  List<ZoneData> zoneList = [];
  ZoneData? selectedZoneValue;

  String userId = "";
  String authorizationToken = "";
  File? selectedProfileImage;

  RxList<String> selectedZoneIdList = RxList<String>([]);

  UserPreference userPreference = UserPreference();
  GlobalKey<FormState> updateProfileKey = GlobalKey<FormState>();
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController phoneNoFieldController = TextEditingController();

  /// Get from gallery
  getImageFromGallery() async {
    isLoading(true);
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      selectedProfileImage = File(pickedFile.path);
    }
    isLoading(false);
  }

  /// Get from Camera
  getImageFromCamera() async {
    isLoading(true);
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      selectedProfileImage = File(pickedFile.path);
    }
    isLoading(false);
  }

  showImagePickerBottomSheet({
    required BuildContext context,
  }) {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 15, bottom: 15),
                  child: Text(
                    "Albums",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              dense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              leading: const Icon(
                Icons.camera_alt_rounded,
                color: AppColors.greyColor,
                size: 25,
              ),
              title: const Text("Camera"),
              onTap: () {
                Get.back();
                getImageFromCamera();
              },
            ),
            ListTile(
              dense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              leading: const Icon(
                Icons.perm_media_rounded,
                color: AppColors.greyColor,
                size: 25,
              ),
              title: const Text("Library"),
              onTap: () {
                Get.back();
                getImageFromGallery();
              },
            ),
            ListTile(
              dense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              leading: const Icon(
                Icons.close,
                color: AppColors.greyColor,
                size: 25,
              ),
              title: const Text("Cancel"),
              onTap: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  /// Get Zone List Function
  Future<void> getZoneListFunction() async {
    isLoading(true);
    String url = ApiUrl.zoneApi;
    log('getZoneListFunction Api Url : $url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      log('getZoneListFunction Response :${response.body}');

      ZoneModel zoneModel = ZoneModel.fromJson(json.decode(response.body));
      isSuccessStatus.value = zoneModel.success;

      if (isSuccessStatus.value) {
        zoneList.clear();
        if (zoneModel.data.isNotEmpty) {
          zoneList.addAll(zoneModel.data);
          selectedZoneValue = zoneList[0];
        }
        // log('selectedZoneValue : ${selectedZoneValue!.name}');
      } else {
        log('getZoneListFunction Else');
      }
    } catch (e) {
      log('getZoneListFunction Error :$e');
      rethrow;
    }
    await getUserProfileFunction();
  }

  selectValueFromDropdown(ZoneData value) {
    selectedZoneValue = value;
    isLoading(true);
    isLoading(false);
  }

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

        selectedProfileImage = File(getProfileModel.data.image);
        log("apiGetProfileImage $selectedProfileImage");

        for (int i = 0; i < zoneList.length; i++) {
          if (getProfileModel.data.zoneId == zoneList[i].id) {
            selectedZoneValue = zoneList[i];
          }
        }
      } else {
        Fluttertoast.showToast(msg: getProfileModel.message);
      }
    } catch (e) {
      log("getUserProfileFunction error: $e");
      rethrow;
    }
    isLoading(false);
  }

  updateProfileDataFunction() async {
    isLoading(true);

    String url = "${ApiUrl.updateProfileApi}$userId";
    log("updateProfileDataFunction url: $url");
    try {
      if (selectedProfileImage != null) {
        var request = http.MultipartRequest('POST', Uri.parse(url));

        request.files.add(
          await http.MultipartFile.fromPath(
            "image",
            selectedProfileImage!.path,
          ),
        );

        request.fields['id'] = userId;
        request.fields['name'] = nameFieldController.text;
        // request.fields['EmailId'] = emailcontroller.text;
        request.fields['email'] = emailFieldController.text;
        request.fields['phoneno'] = phoneNoFieldController.text;
        request.fields['zone_id'] = "${selectedZoneValue!.id}";

        request.headers['Authorization'] = "Bearer $authorizationToken";

        log('updateProfileDataFunction request.fields: ${request.fields}');
        log("selectedZoneValue zodeid ${selectedZoneValue!.id}");
        log("selectedZoneValue Zonename ${selectedZoneValue!.name}");

        var response = await request.send();

        response.stream
            .transform(const Utf8Decoder())
            .transform(const LineSplitter())
            .listen((value) async {
          UpdateProfileModel updateProfileModel =
              UpdateProfileModel.fromJson(json.decode(value));
          log('updateProfileDataFunction response body is ::: $value');
          successStatus.value = updateProfileModel.success;

          if (successStatus.value) {
            Fluttertoast.showToast(
              msg: updateProfileModel.message,
              toastLength: Toast.LENGTH_SHORT,
            );
            // log(updateProfileMOdel.message);

            userPreference.setStringValueInPrefs(
                key: UserPreference.userNameKey,
                value: updateProfileModel.data.name);
            userPreference.setStringValueInPrefs(
                key: UserPreference.userEmailKey,
                value: updateProfileModel.data.email);

            userPreference.setStringValueInPrefs(
                key: UserPreference.userPhoneKey,
                value: updateProfileModel.data.phoneno);
            userPreference.setStringValueInPrefs(
                key: UserPreference.userZoneIdKey,
                value: updateProfileModel.data.zoneId);

            Get.back();
          } else {
            log("false false");
          }
        });
      } else {
        var request = http.MultipartRequest('POST', Uri.parse(url));

        request.fields['id'] = userId;
        request.fields['name'] = nameFieldController.text;
        // request.fields['EmailId'] = emailcontroller.text;
        request.fields['email'] = emailFieldController.text;
        request.fields['phoneno'] = phoneNoFieldController.text;
        request.fields['zone_id'] = "${selectedZoneValue!.id}";
        request.headers['Authorization'] = "Bearer $authorizationToken";

        log('updateProfileDataFunction request.fields: ${request.fields}');
        log("selectedZoneValue zodeid ${selectedZoneValue!.id}");
        log("selectedZoneValue Zonename ${selectedZoneValue!.name}");

        var response = await request.send();

        response.stream
            .transform(const Utf8Decoder())
            .transform(const LineSplitter())
            .listen((value) async {
          UpdateProfileModel updateProfileModel =
              UpdateProfileModel.fromJson(json.decode(value));
          log('updateProfileDataFunction response body is ::: $value');
          successStatus.value = updateProfileModel.success;

          if (successStatus.value) {
            Fluttertoast.showToast(
              msg: updateProfileModel.message,
              toastLength: Toast.LENGTH_SHORT,
            );
            // log(updateProfileMOdel.message);

            userPreference.setStringValueInPrefs(
                key: UserPreference.userNameKey,
                value: updateProfileModel.data.name);
            userPreference.setStringValueInPrefs(
                key: UserPreference.userEmailKey,
                value: updateProfileModel.data.email);

            userPreference.setStringValueInPrefs(
                key: UserPreference.userPhoneKey,
                value: updateProfileModel.data.phoneno);
            userPreference.setStringValueInPrefs(
                key: UserPreference.userZoneIdKey,
                value: updateProfileModel.data.zoneId);

            Get.back();
          } else {
            log("false false");
          }
        });
      }
    } catch (e) {
      log("updateProfileDataFunction error :$e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<void> initMethod() async {
    userId = await userPreference.getUserLoggedInFromPrefs(
        key: UserPreference.userIdKey);
    log("getUserLoggedInFromPrefs userid $userId");
    authorizationToken = await userPreference.getAuthorizationToken(
        key: UserPreference.userTokenKey);
    // log("getUserLoggedInFromPrefs authorizationToken $authorizationToken");

    await getZoneListFunction();
  }

  @override
  void onInit() {
    initMethod();

    super.onInit();
  }
}
