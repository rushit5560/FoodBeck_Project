import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/check_out_screen_controller.dart';

class CheckoutScreen extends StatelessWidget {
   CheckoutScreen({Key? key}) : super(key: key);
final checkOurScreenController =Get.put(CheckOurScreenController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
