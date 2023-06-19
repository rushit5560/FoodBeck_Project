import 'package:get/get.dart';

class CartScreenController extends GetxController {
  RxInt counter = 1.obs;
  RxBool isLoading = false.obs;

  void increment() {
    counter.value++;
    loadUI();
  }

  void decrement() {
    if (counter > 1) {
      counter.value--;
    }
    loadUI();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
