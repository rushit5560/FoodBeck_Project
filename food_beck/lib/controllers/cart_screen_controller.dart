import 'dart:developer';

import 'package:get/get.dart';

class CartScreenController extends GetxController {
  RxInt qty = 1.obs;
  RxBool isLoading = false.obs;
  RxDouble subTotalAmount = 0.0.obs;
  int productPrice = 150;
  double? itemTotalPrice;
  RxDouble itemAddonPrice = 0.0.obs;
  List offersList = [1,2,3,4,5];
  RxDouble offerAmount = 0.0.obs;
  RxBool appliedOffer = false.obs;
  void increment() {
    qty.value++;
    subTotalAmount.value = (productPrice * qty.value).toDouble();
      itemTotalPrice = subTotalAmount.value + itemAddonPrice.value;
    log("itemTotalPrice $itemTotalPrice");
    loadUI();
  }

  void decrement() {
    if (qty > 1) {
      qty.value--;
      subTotalAmount.value = (productPrice * qty.value).toDouble();
      itemTotalPrice = subTotalAmount.value + itemAddonPrice.value;


    }
    loadUI();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
