import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_beck/constants/message.dart';
import 'package:get/get.dart';

import '../../common_modules/common_appbar.dart';
import '../../common_modules/custom_loader.dart';
import '../../controllers/your_orders_screen_controller.dart';
import 'your_orders_screen_widgets.dart';

class YourOrdersScreen extends StatelessWidget {
  YourOrdersScreen({Key? key}) : super(key: key);
  final yourOrdersScreenController = Get.put(YourOrdersScreenController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: customAppBar(titleText: AppMessage.yourOrdersLabel, leadingShow: false, actionShow: false),

        body: Obx(
            ()=> yourOrdersScreenController.isLoading.value
                ? const CustomLoader()
                : Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(text: AppMessage.ongoingLabel),
                    Tab(text: AppMessage.completeLabel),
                  ],
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
                    Expanded(
                      child: TabBarView(
                        dragStartBehavior: DragStartBehavior.start,
                        children: [
                          yourOrdersScreenController.onGoingOrdersList.isEmpty
                              ? Center(
                                  child: Text(AppMessage.noOngoingOrdersLabel))
                              : OngoingOrderList(),
                          yourOrdersScreenController.completeOrderList.isEmpty
                              ? Center(
                                  child: Text(AppMessage.noOrdersFoundLabel))
                              : CompleteOrderList(),
                        ],
                      ),
                    ),
                  ],
            ),
        ),


      ),
    );
  }
}
