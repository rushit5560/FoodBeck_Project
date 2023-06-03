import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/color.dart';
import 'choice _topic_screen_widgets.dart';

class ChoiceTopicScreen extends StatelessWidget {
  const ChoiceTopicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppColors.whiteColor2,
      body: SafeArea(child: const ChoiceTopicModule().paddingSymmetric(horizontal: 10)),
    );
  }
}
