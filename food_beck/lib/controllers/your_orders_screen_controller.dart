import 'package:get/get.dart';

class YourOrdersScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List onGoingOrdersList = [1,2,3,4,5,6,7,8,9,0];
  List completeOrderList = [1,2,3,4,5,6,7,8,9,0];

}