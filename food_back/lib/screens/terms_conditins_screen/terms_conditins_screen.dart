import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../controller/terms_conditins_screen_controller.dart';
class TermsAndConditionsScreen extends StatelessWidget {
   TermsAndConditionsScreen({Key? key}) : super(key: key);
   final termsAndConditionsScreenController = Get.put(TermsAndConditionsScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Obx(()=>termsAndConditionsScreenController.isLoading.value ?
            const CircularProgressIndicator()
          :SingleChildScrollView(
          scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(termsAndConditionsScreenController.title,
                ),
                Html(
                    data: termsAndConditionsScreenController.text,
                ),
              ],
            ),
          ),
        ),
       // termsAndConditionsScreenController.cmsPage[i].content,
      ),
    );
  }
}
