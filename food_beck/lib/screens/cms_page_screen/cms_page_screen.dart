import 'package:flutter/material.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:get/get.dart';
import '../../common_modules/custom_loader.dart';
import '../../constants/color.dart';
import '../../controllers/cms_page_screen_controller.dart';


class CMSPageScreen extends StatelessWidget {
  CMSPageScreen({Key? key}) : super(key: key);
  final cMSPageScreenScreenController =
      Get.put(CMSPageScreenScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.greenColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        title: Obx(
          () => Text(cMSPageScreenScreenController.title.value),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => cMSPageScreenScreenController.isLoading.value
              ? const CustomLoader()
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: HtmlContentViewer(
                    htmlContent: cMSPageScreenScreenController.text,
                  ),
                ),
        ),
      ),
    );
  }
}
