import 'package:get/get.dart';

class CartScreenController extends GetxController{
  RxInt counter = 1.obs;
  RxBool isLoading = false.obs;

  void increment() {
    counter.value++;
  }

  void decrement() {
    isLoading(true);

    counter.value--;
    isLoading(false);

  }
}