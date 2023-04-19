import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constance/api_url.dart';
import '../model/cms_screen_model/cms_screen_model.dart';

class TermsAndConditionsScreenController extends GetxController{
  //String pageId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool successStatus = false.obs;
  String text="";
  String title="";
  List<CmsPage> cmsPage = [];
  Future<void> cmsPageFunction() async {
    isLoading(true);
    String url = "${ApiUrl.cmsApi}4";
    log("cmsPageFunction url : $url");
    try {
      http.Response response = await http.get(Uri.parse(url));
      log('response :${response.body}');
      CmsPageModel cmsPageModel = CmsPageModel.fromJson(json.decode(response.body));
      successStatus.value = cmsPageModel.success;
      if (successStatus.value) {
        cmsPage.addAll(cmsPageModel.data);
        title=cmsPageModel.data[0].title;
        text=cmsPageModel.data[0].content;
        log("title$title");
        log("text $text");
      } else {
        log("cmsPageFunction Error");
      }
    } catch (e) {
      log("cmsPageFunction Error $e");
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
    await cmsPageFunction();
  }
}