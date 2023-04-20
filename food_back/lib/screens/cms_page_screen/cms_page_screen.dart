import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:food_back/utils/style.dart';
import 'package:get/get.dart';
// import '../../common_modules/common_loader.dart';
import '../../common_modules/custom_loader.dart';
import '../../constance/color.dart';
import '../../controller/cms_page_screen_controller.dart';

class CMSPageScreen extends StatelessWidget {
  CMSPageScreen({Key? key}) : super(key: key);
  final cMSPageScreenScreenController =
      Get.put(CMSPageScreenScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(
          () => Text(
            cMSPageScreenScreenController.title.value,
            style: TextStyleConfig.textStyle(
              //fontFamily: FontFamilyText.sFProDisplayRegular,
              textColor: AppColors.blackColor,
              fontWeight: FontWeight.bold,
              // fontSize: 14.sp,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => cMSPageScreenScreenController.isLoading.value
              ? const CustomLoader()
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Html(
                    data: cMSPageScreenScreenController.text,
                  ),
                ),
        ),
      ),
    );
  }
}
