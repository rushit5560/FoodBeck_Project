import 'package:flutter/material.dart';
import 'package:food_back/constance/extension.dart';
import 'package:food_back/screens/recipes_screen/recipes_screen_widgets.dart';
import 'package:get/get.dart';
import '../../controller/recipes_screen_controller.dart';

class RecipesScreen extends StatelessWidget {
  final Function(bool)? onPressed;
    RecipesScreen({Key? key,this.onPressed}) : super(key: key);
   final recipesScreenController = Get.put(RecipesScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SearchbarAndFooTypeModule(),
              BannerModule(),
              TakeYourPickModule(),
              BreakfastModule(),
              SnackModule(),
              LunchModule(),
              DinnerModule(),
            ],
          ),
        ).commonSymmetricPadding(vertical: 10),
      ),
    );
  }
}
