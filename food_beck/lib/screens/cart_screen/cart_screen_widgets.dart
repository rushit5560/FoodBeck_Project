import 'package:flutter/material.dart';
import 'package:food_beck/constants/color.dart';

class ListviewBuilderModule extends StatelessWidget {
  const ListviewBuilderModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(color: AppColors.lightGreenColor)
          ,
        );
      }),
    );
  }
}
