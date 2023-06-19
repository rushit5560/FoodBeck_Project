import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/common_appbar.dart';
import '../../constants/color.dart';
import '../../controllers/cart_screen_controller.dart';
import '../../utils/style.dart';
import 'cart_screen_widgets.dart';

class CartScreen extends StatelessWidget {
  final Function(bool)? onPressed;

  CartScreen({Key? key, this.onPressed}) : super(key: key);
  final cartScreenController = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleText: "Your basket",
        leadingShow: false,
        actionShow: false,
      ),
      body: Column(
        children: [
          ListviewBuilderModule(),
        ],
      ).paddingSymmetric(horizontal: 10, vertical: 10),
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: AppColors.greenColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Text(
              "\$ 401",
              style: TextStyleConfig.textStyle(
                  textColor: AppColors.whiteColor2, fontSize: 12.sp),
            ),
            // const SizedBox(width: 10),
            const Spacer(),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("Add to cart").paddingSymmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
              ),
            )
          ],
        ).paddingSymmetric(horizontal: 10),
      ),
    );
  }
}
