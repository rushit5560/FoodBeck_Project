import 'package:flutter/material.dart';
import 'package:food_back/constance/extension.dart';

import '../../constance/color.dart';
import 'choice _topic_screen_widgets.dart';

class ChoiceTopicScreen extends StatelessWidget {
  const ChoiceTopicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppColors.whiteColor2,
      body:ChoiceTopicModule().commonSymmetricPadding(horizontal: 10),
    );
  }
}